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
    
//    func saveArticle() {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {
//            print("Error: No current user")
//            return
//        }
//        
//        let newArticle = PublishedArticle(id: UUID(), title: self.article.title, description: self.article.description)
//        
//        let userDocumentRef = Firestore.firestore().collection("users").document(currentUserID)
//        userDocumentRef.getDocument { [weak self] (document, error) in
//            guard let self = self else { return }
//            if let error = error {
//                print("Error getting user document: \(error.localizedDescription)")
//                return
//            }
//            if let document = document, document.exists {
//                userDocumentRef.updateData(["publishedArticle": FieldValue.arrayUnion([newArticle.asDictionary])]) { error in
//                    if let error = error {
//                        print("Error updating document: \(error)")
//                    } else {
//                        print("\(self.article.description)")
//                        print("\(self.article.title)")
//
//                        print("Artikel gespeichert")
//                        self.article.title = ""
//                        self.article.description = ""
//                        
//                    }
//                }
//            } else {
//                userDocumentRef.setData(["publishedArticle": [newArticle.asDictionary]]) { error in
//                    if let error = error {
//                        print("Error adding document: \(error)")
//                    } else {
//                        print("\(self.article.description)")
//                        print("\(self.article.title)")
//                        print("Artikel gespeichert")
//                        self.article.title = ""
//                        self.article.description = ""
//                        
//                    }
//                }
//            }
//        }
//    }
}
extension PublishedArticle {
    var asDictionary: [String: Any] {
        return [
            "id": id.uuidString,
            "title": title,
            "description": description
        ]
    }
}
