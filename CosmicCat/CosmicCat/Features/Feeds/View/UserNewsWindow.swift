//
//  UserNewsWindow.swift
//  CosmicCat
//
//  Created by Sarah Huth on 16.04.24.
//

import SwiftUI

struct UserNewsWindow: View {
    
    var imageName : URL? = nil
    var title = ""
    var description = ""
    
    @State var isLiked = false
    let article: PublishedArticle
    
    @EnvironmentObject var viewModel: NewsFeedListViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    VStack{
                        Spacer()
                    }
                    .background{
                        AsyncImage(url: imageName) { image in
                            image.resizable()
                            image.frame(width: 300, height: 150)
                            image.aspectRatio(contentMode: .fit)
                            
                        } placeholder: {
                            Image(.cosmicCatTransparent)
                                .resizable()
                                .scaledToFill()
                            ProgressView()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(.petrol)
                
                VStack{
                    
                    Text(article.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.3))
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .background(Color.white.opacity(0.5))
                .foregroundColor(.black)
                
            }
            .frame(width: 250, height: 200)
            .background(Color.black.opacity(0.3))
            .clipShape(
                .rect(
                    topLeadingRadius: 20.0,
                    bottomLeadingRadius: 10.0,
                    bottomTrailingRadius: 20.0,
                    topTrailingRadius: 10.00
                )
            )
        }
    }
}


