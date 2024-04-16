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
                 let newsFeeds = documents.compactMap { document in
                    try? document.data(as: PublishedArticle.self)
                }
                
                DispatchQueue.main.async {
                    self.userFeedItems.append(contentsOf: newsFeeds)
                }
                print("Liste aus dem FeedViewModel\(self.userFeedItems)")
            }
    }
}

