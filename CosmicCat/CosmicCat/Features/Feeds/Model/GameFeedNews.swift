//
//  GameFeedNews.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

//import Foundation
//
//struct FeedItem: Identifiable {
//    let id = UUID()
//    let title: String
//    let imageName: String
//    let category: String
//    let description: String
//}

import Foundation


// Diese Struktur implementiert das `Codable` Protokoll, um die Konvertierung zwischen JSON und dieser Struktur zu ermöglichen.
struct FeedItem: Codable {
    
    
    let articles: [Article]    // Ein Array von `Article`-Strukturen, die die einzelnen Nachrichtenartikel darstellen.
}

// Definition der Struktur `Article`, die einen einzelnen Nachrichtenartikel repräsentiert.
// Auch diese Struktur implementiert das `Codable` Protokoll.
struct Article: Codable, Identifiable {
    let id = UUID()
    
    let source: Source?         // Die Quelle des Artikels, repräsentiert durch eine `Source`-Struktur.
    let author: String?        // Der Autor des Artikels. Optional, da nicht alle Artikel einen Autor haben müssen.
    let title: String?          // Der Titel des Artikels.
    let description: String?   // Eine kurze Beschreibung oder Einleitung des Artikels. Optional, da nicht alle Artikel eine Beschreibung haben.
    let urlToImage: URL?       // Eine URL zu einem Bild, das den Artikel begleitet. Optional, da nicht alle Artikel Bilder haben.
    
    func toFireNewsFeed() -> FireNewsFeed {
        
                
        return FireNewsFeed(author: author ?? "Author not found", title: title ?? "Title not found", description: description ?? "Description not found", urlToImage: urlToImage ?? URL(string:"https://firebasestorage.googleapis.com/v0/b/cosmiccat-95cc6.appspot.com/o/CosmicCatTransparent.png?alt=media&token=ebb33f91-dca9-42ce-84b4-79aa6bdfeb7c") )
    }
}

// Definition der Struktur `Source`, die die Quelle eines Nachrichtenartikels repräsentiert.
// Diese Struktur ist ebenfalls `Codable` für die JSON-Konvertierung.
struct Source: Codable {
    let id: String?            // Eine eindeutige Kennung für die Nachrichtenquelle. Optional, da nicht alle Quellen eine ID haben.
    let name: String           // Der Name der Nachrichtenquelle, z.B. der Name einer Zeitung oder eines Online-Portals.
}

