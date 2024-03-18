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
                            NavigationLink(destination: Text("Detailansicht für \(item.title)")) {
                                FeedItemView(feedItem: item)
                            }
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct FeedItemView: View {
    let feedItem: FeedItem

    var body: some View {
        ScrollView(.horizontal){
            NewsWindow(category: feedItem.category, imageName: feedItem.imageName,title: feedItem.title, description: feedItem.description)
            
        }
    }
}

// Dein Preview-Provider
struct FeedsOverview_Previews: PreviewProvider {
    static var previews: some View {
        FeedsOverview()
    }
}
