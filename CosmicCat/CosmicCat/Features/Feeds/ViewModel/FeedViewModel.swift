//
//  FeedViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var feedItems: [Article] = []
    
    private var apiRepo = ApiNewsRepository()
    
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
    
}

