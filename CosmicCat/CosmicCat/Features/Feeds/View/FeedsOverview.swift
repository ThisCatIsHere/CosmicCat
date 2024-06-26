//
//  FeedsOverview.swift
//  CosmicCat
//
//  Created by Sarah Huth on 10.03.24.
//

import SwiftUI

struct FeedsOverview: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var sheet: Sheet?
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(viewModel.feedItems) { item in
                                NavigationLink(destination: DetailView(article: item)) {
                                    NewsWindow(imageName: item.urlToImage,title: item.title ?? "empty title", description: item.description ?? "empty description", article: item)
                                }
                            }
                        }
                        .padding()
                    }
                    .onAppear(perform: viewModel.load)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Text("Game News Artikel von \n anderen Usern geschrieben")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            
                            ForEach(viewModel.userFeedItems) { item in
                                NavigationLink(destination: UserFeedsDetailView(article: item)) {
                                    UserNewsWindow(article: item)

                                }
                            }
                        }
                        .padding()
                    }
                   
                    .frame(maxWidth: .infinity)
                }
                .onAppear{
                    viewModel.loadUserFeeds()
                }
                
            }
            .navigationTitle("Deine Game News")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    sheet = .settings
                } label: {
                    Image(systemName: "gearshape.fill")
                }
            }
            .sheet(item: $sheet) { item in
                // Entscheide hier basierend auf dem Wert von 'item', welches Sheet angezeigt werden soll
                switch item {
                case .create:
                    // Hier die View für 'create' zurückgeben
                    Text("Create Sheet")
                case .settings:
                    SettingsView(sheet: $sheet)
                }
            }
        }
    }
    
    
    // Dein Preview-Provider
    struct FeedsOverview_Previews: PreviewProvider {
        static var previews: some View {
            FeedsOverview()
        }
    }
}
