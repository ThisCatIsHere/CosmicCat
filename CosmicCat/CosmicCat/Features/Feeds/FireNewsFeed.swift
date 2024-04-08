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
    
   
    var title: String
    var description: String
    
  
}

extension FireNewsFeed {
    func toDictionary () -> [String: Any] {
        var dict = [String: Any]()
        dict ["title"] = title
        dict ["description"] = description
        return dict
    }
}
