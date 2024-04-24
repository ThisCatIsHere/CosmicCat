import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// Ein ViewModel-Klasse, die ObservableObject implementiert, um die Benutzeroberfläche bei Datenänderungen zu aktualisieren.
class ReadingListViewModel: ObservableObject, Identifiable {
    
    private var listener: ListenerRegistration?  // Firestore-Listener, um Echtzeit-Updates zu erhalten.
    
    @Published var articles: [FireNewsFeed] = []  // Speichert eine Liste von Artikeln, die in der UI angezeigt werden.
    
    // Lädt die bevorzugten Artikel eines Benutzers aus Firestore.
    func loadFavorits() {
        // Prüft, ob eine Benutzer-ID vorhanden ist.
        guard let userId = FireBaseManager.shared.userId else { return }
        
        // Setzt einen Listener auf die Firestore-Dokumentensammlung des Benutzers.
        self.listener = FireBaseManager.shared.firestore.collection("users").document(userId).collection("articles")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error)  // Gibt Fehler aus.
                    return
                }
                // Prüft, ob Dokumente vorhanden sind.
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim Laden der Artikel")
                    return
                }
                // Wandelt jedes Firestore-Dokument in ein FireNewsFeed-Objekt um.
                self.articles = documents.compactMap { queryDocumentSnapshot -> FireNewsFeed? in
                    try? queryDocumentSnapshot.data(as: FireNewsFeed.self)
                }
            }
    } // Ende von loadFavorits
    
    // Entfernt den Firestore-Listener und leert die Artikel-Liste.
    func removeListener() {
        articles.removeAll()
        listener?.remove()
    }
    
    // Löscht einen spezifischen Artikel aus der Firestore-Datenbank.
    func deleteArticle(_ article: FireNewsFeed) {
        // Sicherstellen, dass eine Benutzer-ID und eine Artikel-ID vorhanden sind.
        guard let userId = FireBaseManager.shared.userId, let articleId = article.id else { return }
        // Löscht den Artikel aus der Firestore-Sammlung.
        FireBaseManager.shared.firestore.collection("users").document(userId).collection("articles").document(articleId).delete() { error in
            if let error = error {
                print("Fehler beim Löschen des Artikels: \(error.localizedDescription)")  // Fehlermeldung bei Misserfolg.
            } else {
                print("Artikel erfolgreich gelöscht")
                self.loadFavorits()  // Aktualisiert die Liste nach dem Löschen.
            }
        }
    }
}
