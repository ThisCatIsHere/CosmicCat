//
//  FeedViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FeedViewModel: ObservableObject {
    @Published var feedItems: [Article] = []
    @Published var userFeedItems: [PublishedArticle] = []
    
    private var apiRepo = ApiNewsRepository()
    private var listener: ListenerRegistration?
    
    init() {
        self.loadUserFeeds()
    }
    
    @MainActor
    func load() {
        Task {
            do {
                self.feedItems = try await self.apiRepo.fetchNews(searchText: "gaming")
            } catch {
                print(error)
            }
        }
    }
    
    func loadUserFeeds() {
        self.listener = FireBaseManager.shared.firestore.collection("articles")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim Laden der Artikel")
                    return
                }
                self.userFeedItems = documents.compactMap { queryDocumentSnapshot -> PublishedArticle? in
                    print(queryDocumentSnapshot.data())
                   return try? queryDocumentSnapshot.data(as: PublishedArticle.self)
                }
                print("Liste aus dem FeedViewModel\(self.userFeedItems)")
            }
    }
}

