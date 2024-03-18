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
        // Dummy-Daten 
        feedItems = [
            FeedItem(title: "Neues DLC für Valhalla führt euch in Gletscherhöhlen", imageName: "valhalla", category: "Abenteuer", description: "Entdecke die tiefen Gletscherhöhlen im neuesten DLC von Valhalla..."),
            FeedItem(title: "Neues DLC für Valhalla führt euch in Gletscherhöhlen", imageName: "valhalla", category: "Abenteuer", description: "Entdecke die tiefen Gletscherhöhlen im neuesten DLC von Valhalla...")
            ]
       }
}

