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
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if authenticationViewModel.userIsLoggedIn {
                HomeView()
                    .environmentObject(authenticationViewModel)
            } else {
                AuthenticationView()
                    .environmentObject(authenticationViewModel)
            }
        }
    }
}
