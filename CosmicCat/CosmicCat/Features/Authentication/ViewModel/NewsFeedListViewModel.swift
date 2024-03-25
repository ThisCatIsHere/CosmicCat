//
//  NewsFeedListViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class NewsFeedListViewModel: ObservableObject {
    
    // MARK: - Variables
    
    private var listener: ListenerRegistration?
    
    @Published var feed: [FireNewsFeed] = []
    
    var viewModel = AuthenticationViewModel()
    
    func saveArticle(_ article: FireNewsFeed) {
        let db = Firestore.firestore()
        guard let userId = viewModel.user?.id else {
            print("Error: Artikel hat keine userId.")
            return
        }
        let articleRef = db.collection("users").document(userId).collection("articles").document()
        articleRef.setData(article.toDictionary()) { error in
            if let error = error {
                print("Error adding article: \(error)")
            } else {
                print("Article successfully added with ID: \(articleRef.documentID)")
            }
        }
    }
}

extension FireNewsFeed {
    func toDictionary () -> [String: Any] {
        var dict = [String: Any]()
        dict ["userId"] = userId
        dict ["title"] = title
        dict ["description"] = description
        return dict
    }
}
