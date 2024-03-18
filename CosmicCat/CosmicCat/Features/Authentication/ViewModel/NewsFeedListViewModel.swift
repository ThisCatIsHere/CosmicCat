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






