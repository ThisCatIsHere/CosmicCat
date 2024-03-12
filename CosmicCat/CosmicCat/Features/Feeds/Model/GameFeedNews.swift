//
//  GameFeedNews.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

import Foundation

struct FeedItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let category: String
    let description: String
}

