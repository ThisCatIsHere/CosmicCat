//
//  FeedItemView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 22.03.24.
//

import SwiftUI

struct FeedItemView: View {
    let feedItem: Article
    
    

    var body: some View {
        ScrollView(.horizontal){
            NewsWindow(imageName: feedItem.urlToImage,title: feedItem.title ?? "empty title", description: feedItem.description ?? "empty description", article: feedItem)
        }
    }
}


