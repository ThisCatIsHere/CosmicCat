import Foundation
import Firebase

// Eine ViewModel-Klasse für das Erstellen und Verwalten von Artikeln.
class WriteViewModel: ObservableObject {
    @Published var article: FireNewsFeed = FireNewsFeed(author: "", title: "", description: "", urlToImage: placeholderImage)
    // Variablen zur Anzeige von Benachrichtigungen.
    @Published var showAlert = false
    @Published var alertMessage = ""

    // Speichert den aktuellen Artikel in der Firestore-Datenbank.
    func saveArticle() {
        // Referenz zum 'articles'-Dokument in Firestore.
        let articleRef = FireBaseManager.shared.firestore.collection("articles").document()
        do {
            // Versucht, den Artikel in Firestore zu speichern und behandelt das Ergebnis asynchron.
            try articleRef.setData(from: self.article) { error in
                DispatchQueue.main.async {  // Sicherstellung, dass UI-Updates im Hauptthread ausgeführt werden.
                    if let error = error {
                        // Fehlermeldung, falls das Speichern fehlschlägt.
                        self.alertMessage = "Fehler beim Hinzufügen des Artikels: \(error.localizedDescription)"
                    } else {
                        // Erfolgsmeldung, wenn der Artikel erfolgreich gespeichert wurde.
                        self.alertMessage = "Artikel erfolgreich veröffentlicht"
                    }
                    self.showAlert = true  // Benachrichtigung anzeigen.
                    self.clearFields()  // Felder zurücksetzen nach der Speicherung.
                }
            }
        } catch {
            print("Error setting document: \(error)")
        }
    }
    
    // Setzt die Textfelder des Artikelformulars zurück.
    func clearFields() {
        article.title = ""
        article.description = ""
    }
}

// Eine Erweiterung für PublishedArticle, die eine Methode zur Konvertierung in ein Dictionary bereitstellt.
extension PublishedArticle {
    var asDictionary: [String: Any] {
        return [
            "id": id,
            "title": title,
            "description": description
        ]
    }
}
