//
//  FeedViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var feedItems: [FeedItem] = []
    
    init() {
        // Füge hier deine Dummy-Daten ein
        feedItems = [
            FeedItem(title: "Neues DLC für Valhalla führt euch in Gletscherhöhlen", imageName: "valhalla", category: "Abenteuer", description: "Entdecke die tiefen Gletscherhöhlen im neuesten DLC von Valhalla..."),
            // Füge hier weitere Dummy-FeedItems hinzu
        ]
        feedItems = [
            FeedItem(title: "Ab auf die Alm", imageName: "cod",category: "Shooter", description: "Neue Map für CoD gibt Euch völlig neue Versteckmöglichkeiten in den Bergen")
        ]
    }
}

