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
        let db = FireBaseManager.shared.firestore
        guard let userId = FireBaseManager.shared.userId else {
            print("Error: Artikel hat keine userId.")
            return
        }
        let articleRef = db.collection("users").document(userId).collection("articles").document()
        do { print(article)
            try articleRef.setData(from: article)
            print("Article successfully added with ID: \(articleRef.documentID)")
            
        } catch {
            print("Error adding article: \(error)")
        }
    }
}



