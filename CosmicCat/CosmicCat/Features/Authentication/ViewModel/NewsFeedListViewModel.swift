//
//  NewsFeedListViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// ViewModel zur Verwaltung von Newsfeed-Artikeln, beobachtbar für UI-Updates.
class NewsFeedListViewModel: ObservableObject {
    
    // MARK: - Variables
    
    private var listener: ListenerRegistration?  // Listener für Echtzeit-Updates aus Firestore (hier nicht verwendet).
    
    @Published var feed: [FireNewsFeed] = []  // Liste der Artikel, die in der UI angezeigt werden.
    
    var viewModel = AuthenticationViewModel()  // Authentifizierungs-ViewModel zur Überprüfung des angemeldeten Benutzers.
    
    // Funktion zum Speichern eines Artikels in Firestore unter der Sammlung eines spezifischen Benutzers.
    func saveArticle(_ article: FireNewsFeed) {
        let db = FireBaseManager.shared.firestore  // Zugriff auf Firestore-Instanz.
        guard let userId = FireBaseManager.shared.userId else {
            // Sicherstellen, dass eine Benutzer-ID vorhanden ist, sonst Fehlermeldung ausgeben.
            print("Error: Artikel hat keine userId.")
            return
        }
        // Referenz zum Dokumentpfad, wo der Artikel gespeichert werden soll.
        let articleRef = db.collection("users").document(userId).collection("articles").document()
        do {
            // Versucht, den Artikel im Firestore zu speichern. Wirft einen Fehler, wenn dies misslingt.
            try articleRef.setData(from: article)
            // Bestätigungsmeldung mit der ID des gespeicherten Dokuments.
            print("Article successfully added with ID: \(articleRef.documentID)")
            
        } catch {
            // Fehlerausgabe, wenn das Speichern fehlschlägt.
            print("Error adding article: \(error)")
        }
    }
}




