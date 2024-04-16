//
//  FireUser.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation

struct FireUser: Codable {
    var id: String
    var name: String
    var email: String
    var registeredAt: Date
    var publishedArticle: [PublishedArticle]
}
struct PublishedArticle: Codable, Identifiable {
    var id: UUID
    var title: String
    var author: String
    var description: String
    var urlToImage: URL? = placeholderImage!
}
