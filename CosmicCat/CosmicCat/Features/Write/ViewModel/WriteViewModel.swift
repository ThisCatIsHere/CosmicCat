//
//  WriteViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 16.04.24.
//

import Foundation
import Firebase

class WriteViewModel: ObservableObject {
    
    @Published var article: FireNewsFeed = FireNewsFeed(author: "", title: "", description: "", urlToImage: placeholderImage)
    
    func saveArticle() {
        guard let userId = FireBaseManager.shared.userId else {
            print("Error: Artikel hat keine userId.")
            return
        }
//        let articleRef = FireBaseManager.shared.firestore.collection("users").document(userId).collection("publishedArticles").document()
        let articleRef = FireBaseManager.shared.firestore.collection("articles").document()
        do { print(self.article)
            try articleRef.setData(from: self.article)
            print("Article successfully added with ID: \(articleRef.documentID)")
            
        } catch {
            print("Error adding article: \(error)")
        }
    }
}
extension PublishedArticle {
    var asDictionary: [String: Any] {
        return [
            "id": id,
            "title": title,
            "description": description
        ]
    }
}
