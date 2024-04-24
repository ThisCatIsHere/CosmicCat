//
//  FeedViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// Eine Klasse für das View Model, die ObservableObject implementiert, um die Bindung zwischen Daten und UI zu ermöglichen.
class FeedViewModel: ObservableObject {
    @Published var feedItems: [Article] = []  // Speichert Artikel von einer externen API.
    @Published var userFeedItems: [PublishedArticle] = []  // Speichert Artikel, die aus Firestore geladen werden.
    
    private var apiRepo = ApiNewsRepository()  // Repository für API-Anrufe.
    private var listener: ListenerRegistration?  // Firestore-Listener zur Überwachung von Änderungen in Echtzeit.
    
    init() {
        self.loadUserFeeds()  // Lädt Benutzerfeeds beim Initialisieren des ViewModels.
    }
    
    // Asynchrone Methode, markiert mit @MainActor, um auf dem Hauptthread zu laufen, lädt Daten von einer API.
    @MainActor
    func load() {
        Task {
            do {
                // Versucht, Nachrichtenartikel asynchron zu laden, wobei "gaming" als Suchtext verwendet wird.
                self.feedItems = try await self.apiRepo.fetchNews(searchText: "gaming")
            } catch {
                print(error)  // Fehlerausgabe, wenn der API-Aufruf fehlschlägt.
            }
        }
    }
    
    // Methode zum Laden von Benutzerfeeds aus Firestore.
    func loadUserFeeds() {
        // Setzt einen Listener auf eine Firestore-Sammlung "articles".
        self.listener = FireBaseManager.shared.firestore.collection("articles")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)  // Gibt Fehler aus, falls beim Laden ein Problem auftritt.
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim Laden der Artikel")  // Fehlende Dokumente im Snapshot.
                    return
                }
                // Konvertiert jedes Dokument in ein PublishedArticle-Objekt, wenn möglich.
                self.userFeedItems = documents.compactMap { queryDocumentSnapshot -> PublishedArticle? in
                    return try? queryDocumentSnapshot.data(as: PublishedArticle.self)
                }
                print("Liste aus dem FeedViewModel\(self.userFeedItems)")  // Debug-Ausgabe der geladenen Artikel.
            }
    }
}

