//
//  CosmicCatApp.swift
//  CosmicCat
//
//  Created by Sarah Huth on 29.02.24.
//

import SwiftUI
import Firebase

@main
struct CosmicCatApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
