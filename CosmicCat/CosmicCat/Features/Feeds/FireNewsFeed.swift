//
//  FireNewsFeed.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation
import FirebaseFirestoreSwift

struct FireNewsFeed: Codable, Identifiable {
    @DocumentID var id: String?
    
    var author: String
    var title: String
    var description: String
    var urlToImage: URL?
  
    func toArticle() -> Article {
        return Article(source: nil, author: author, title: title, description: description, urlToImage: urlToImage)
    }
}


extension FireNewsFeed {
    func toDictionary () -> [String: Any] {
        var dict = [String: Any]()
        dict["author"] = author
        dict ["title"] = title
        dict ["description"] = description
        dict ["urlToImage"] = urlToImage?.absoluteString
        return dict
    }
}
