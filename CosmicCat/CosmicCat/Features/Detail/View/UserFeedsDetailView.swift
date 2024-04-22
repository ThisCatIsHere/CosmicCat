//
//  UserFeedsDetailView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 16.04.24.
//

import SwiftUI

struct UserFeedsDetailView: View {
    
    var imageName : URL? = nil
    let article: PublishedArticle
    @State private var isFavorite: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer().frame(height: geometry.safeAreaInsets.top + 300)
                        
                        // Der Inhalt, der hinter dem Bild verschwinden soll
                        VStack(alignment: .leading) {
                            HStack {
                                Text(article.author)
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                    
                            }
                            .padding([.horizontal, .top])
                            
                            Text(article.description)
                            
                                .padding()
                        }
                    }
                    // Sorgt dafür, dass der Text auf weißem Hintergrund scrollt
                    .background(Color.white)
                }
                .edgesIgnoringSafeArea(.top)
                
                
                    AsyncImage(url: imageName) { image in
                        image.resizable()
                        image.scaledToFit()
                    } placeholder: {
                        Image(.cosmiccatlogo)
                            .resizable()
                            .scaledToFill()
                        ProgressView()
                    }
                    .frame(width: geometry.size.width, height: 300)
                    .clipped()
                    .overlay(
                        VStack {
                            Spacer()
                            Text(article.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.black.opacity(0.3))
                        },
                        alignment: .bottomLeading
                    )
                }
            }
        }
    }




