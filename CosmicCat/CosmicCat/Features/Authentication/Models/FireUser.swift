//
//  FireUser.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation
import FirebaseFirestoreSwift

// Definiert eine Struktur für Benutzerdaten in Firebase.
struct FireUser: Codable {
    var id: String  // Eindeutige ID des Benutzers.
    var name: String  // Name des Benutzers.
    var email: String  // E-Mail-Adresse des Benutzers.
    var registeredAt: Date  // Datum der Registrierung des Benutzers.
    var publishedArticle: [PublishedArticle]  // Liste von Artikeln, die vom Benutzer veröffentlicht wurden.
}

// Definiert eine Struktur für einen veröffentlichten Artikel.
struct PublishedArticle: Codable, Identifiable {
    @DocumentID var id: String?  // Firestore-spezifisches Attribut, das als Dokument-ID dient, automatisch verwaltet.
    var title: String  // Titel des Artikels.
    var author: String  // Autor des Artikels.
    var description: String  // Beschreibung des Artikels.
    var urlToImage: URL? = placeholderImage  // URL zum Bild des Artikels, Standardwert ist ein Platzhalterbild.
}
