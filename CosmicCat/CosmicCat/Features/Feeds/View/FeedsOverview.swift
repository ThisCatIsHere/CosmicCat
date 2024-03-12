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
                Image("background") // Setze den Namen deines Hintergrundbildes ein
                    .resizable()
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
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
        VStack(alignment: .leading, spacing: 10) {
            Image(feedItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            Text(feedItem.title)
                .font(.headline)
            
            Text(feedItem.category)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(feedItem.description)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(3)
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(12)
    }
}

// Dein Preview-Provider
struct FeedsOverview_Previews: PreviewProvider {
    static var previews: some View {
        FeedsOverview()
    }
}
