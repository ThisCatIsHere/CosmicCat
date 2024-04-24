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
    
    // StateObject-Anmerkung sorgt dafür, dass diese ViewModels während des gesamten Lebenszyklus der App erhalten bleiben.
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @StateObject var newsFeedListViewModel = NewsFeedListViewModel()
    
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if authenticationViewModel.userIsLoggedIn {
                HomeView()
                    .environmentObject(authenticationViewModel)
                    .environmentObject(newsFeedListViewModel)
            } else {
                AuthenticationView()
                    .environmentObject(authenticationViewModel)
            }
        }
    }
}
