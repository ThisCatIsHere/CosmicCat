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
    
}






//// MARK: - Read
//
//extension NewsFeedListViewModel {
//    func fetchNews() {
//        guard let userId = FirebaseManager.shared.userId else { return }
//        
//        self.listener = FirebaseManager.shared.database.collection("meals").order(by: "title").whereField("userId", isEqualTo: userId)
//            .addSnapshotListener { querySnapshot, error in
//                if let error {
//                    print(error.localizedDescription)
//                    return
//                }
//                
//                guard let documents = querySnapshot?.documents else {
//                    print("Fehler beim Laden der News")
//                    return
//                }
//                
//                self.meals = documents.compactMap { queryDocumentSnapshot -> FireMeal? in
//                    try? queryDocumentSnapshot.data(as: FireMeal.self)
//                }
//            }
//    }
//    
//    func removeListener() {
//        meals.removeAll()
//        listener?.remove()
//    }
//}



//// MARK: - Update
//
//extension MealListViewModel {
//    func updateMeal(with id: String, title: String, description: String) {
//        let data = ["title": title, "description": description]
//        
//        FirebaseManager.shared.database.collection("meals").document(id).setData(data, merge: true) { error in
//            if let error {
//                print("Meal wurde nicht aktualisiert", error.localizedDescription)
//                return
//            }
//            
//            print("Meal aktualisiert!")
//        }
//    }
//}
//
//
//
//// MARK: - Delete
//
//extension MealListViewModel {
//    func deleteMeal(with id: String) {
//        FirebaseManager.shared.database.collection("meals").document(id).delete() { error in
//            if let error {
//                print("Meal kann nicht gelöscht werden", error.localizedDescription)
//                return
//            }
//            
//            print("Meal mit ID \(id) gelöscht")
//        }
//    }
//}
