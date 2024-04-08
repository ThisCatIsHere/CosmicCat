//
//  ReadingListItemViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 26.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ReadingListViewModel: ObservableObject, Identifiable {
    
   
    
    private var listener: ListenerRegistration?
    
    @Published var articles: [FireNewsFeed] = []
    
    //Firestore Logik hier
    func loadFavorits() {
        guard let userId = FireBaseManager.shared.userId else { return }
        
        self.listener = FireBaseManager.shared.firestore.collection("users").document(userId).collection("articles")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim Laden der Artikel")
                    return
                }
                self.articles = documents.compactMap { queryDocumentSnapshot -> FireNewsFeed? in
                    try? queryDocumentSnapshot.data(as: FireNewsFeed.self)
                }
            }
       } //Ende loadFavorits
    
    func removeListener() {
        articles.removeAll()
        listener?.remove()
    }
}