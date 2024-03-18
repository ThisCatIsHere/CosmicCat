//
//  ContentView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 29.02.24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: TabViewItem = .feedsOverview
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = .blackOpac
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
           }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            TabView(selection: $selectedTab) {
                FeedsOverview()
                    .tabItem {
                        Image(systemName: "globe")
                        Text(TabViewItem.feedsOverview.rawValue)
                    }
                    .tag(TabViewItem.feedsOverview)
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text(TabViewItem.favorites.rawValue)
                    }
                    .tag(TabViewItem.favorites)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text(TabViewItem.profile.rawValue)
                    }
                    .tag(TabViewItem.profile)
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text(TabViewItem.settings.rawValue)
                    }
                    .tag(TabViewItem.settings)
            }
        }
        .accentColor(.tuerkis)
    }
}


#Preview {
    ContentView()
}

