//
//  FireNewsFeed.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation
import FirebaseFirestoreSwift

// Struktur zur Modellierung von Nachrichtenfeed-Daten, die mit Firebase Firestore interagieren.
struct FireNewsFeed: Codable, Identifiable {
    @DocumentID var id: String?  // Spezielles Property-Wrapper von Firestore für die Dokument-ID, die automatisch verwaltet wird.
    
    // Grundlegende Eigenschaften eines News-Artikels.
    var author: String
    var title: String
    var description: String
    var urlToImage: URL?  // Optional URL für ein Bild zum Artikel.

    // Konvertiert eine Instanz von FireNewsFeed in eine allgemeinere Article-Struktur.
    func toArticle() -> Article {
        return Article(source: nil, author: author, title: title, description: description, urlToImage: urlToImage)
    }
}

// Erweiterung von FireNewsFeed zur Unterstützung zusätzlicher Funktionalitäten.
extension FireNewsFeed {
    // Konvertiert die Instanz in ein Dictionary, das zur Kommunikation mit Firestore verwendet werden kann.
    func toDictionary () -> [String: Any] {
        var dict = [String: Any]()
        dict["author"] = author
        dict["title"] = title
        dict["description"] = description
        dict["urlToImage"] = urlToImage?.absoluteString  // Speichert die URL als String.
        return dict
    }
}

// Beispiel für eine Platzhalter-URL für ein Bild, das in Firebase gespeichert ist.
let placeholderImage = URL(string: "https://firebasestorage.googleapis.com/v0/b/cosmiccat-95cc6.appspot.com/o/CosmicCatTransparent.png?alt=media&token=ebb33f91-dca9-42ce-84b4-79aa6bdfeb7c")
