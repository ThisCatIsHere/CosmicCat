//
//  FeedsOverview.swift
//  CosmicCat
//
//  Created by Sarah Huth on 10.03.24.
//

import SwiftUI

struct FeedsOverview: View {
    @StateObject var viewModel = FeedViewModel()

    var body: some View {
        NavigationStack{
            ZStack{
                Image("background") 
                    .resizable()
                    .ignoresSafeArea()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(viewModel.feedItems) { item in
                            NavigationLink(destination: DetailView(article: item)) {
                                FeedItemView(feedItem: item)
                            }

                        }
                    }
                    .padding()
                }
                .onAppear(perform: viewModel.load)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct FeedItemView: View {
    let feedItem: Article

    var body: some View {
        ScrollView(.horizontal){
            NewsWindow(imageName: feedItem.urlToImage,title: feedItem.title, description: feedItem.description ?? "empty description")
            
        }
    }
}

// Dein Preview-Provider
struct FeedsOverview_Previews: PreviewProvider {
    static var previews: some View {
        FeedsOverview()
    }
}
