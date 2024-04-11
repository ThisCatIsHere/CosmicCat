//
//  NewsWindow.swift
//  CosmicCat
//
//  Created by Sarah Huth on 13.03.24.
//

import SwiftUI
import FirebaseFirestore


struct NewsWindow: View {
    
    var imageName : URL? = nil
    var title = ""
    var description = ""
    
    @State var isLiked = false
    let article: Article
    
    @EnvironmentObject var viewModel: NewsFeedListViewModel
    
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    VStack{
                        
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                isLiked.toggle()
                                if isLiked {
                                    viewModel.saveArticle(article.toFireNewsFeed())
                                    
                                }
                                
                            }) {
                                Image(systemName: isLiked ? "heart.fill" : "heart" )
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(isLiked ? .white :  .white)
                            }
                        }
                        .padding()
                        .frame(width: 300, height: 60)
                        
                        
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
                                .scaledToFit()
                            ProgressView()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(.blue)
                
                VStack{
                    
                    Text(article.title ?? "No title found")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.3))
                        .onAppear{
                            print("article-title:\(article.title)")
                        }
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .background(Color.white.opacity(0.5))
                .foregroundColor(.black)
                                        
            }
            .frame(width: 300, height: 350)
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
        //        VStack(alignment: .leading, spacing: 10) {
        //            VStack {
        //                AsyncImage(url: imageName) { image in
        //                        image.resizable()
        //                        image.frame(width: 300, height: 150)
        //                        image.aspectRatio(contentMode: .fit)
        //
        //                } placeholder: {
        //                    ProgressView()
        //                }
        //
        //                Button(action: {
        //                viewModel.saveArticle(article)
        //
        //
        //
        //                } ) {
        //                    Image(systemName: "heart")
        //                        .padding(10)
        //                        .background(Color.white.opacity(0.5))
        //                        .clipShape(Circle())
        //                        .foregroundColor(.black)
        //                }
        //                .frame(maxWidth: .infinity)
        //
        //
        //                .cornerRadius(10)
        //            }
        //            .frame(maxWidth: .infinity)
        //            .background(.red)
        //
        //            Text(article.title)
        //                .font(.headline)
        //                .foregroundColor(.white)
        //
        //
        //            Text(article.description)
        //                .multilineTextAlignment(.leading)
        //                .font(.body)
        //                .foregroundColor(.white)
        //                .lineLimit(3)
        //        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .ignoresSafeArea()
        //        .background(Color.green)
        //
        //        .cornerRadius(12)
    }
}
//#Preview {
//    NewsWindow(artikel: FireNewsFeed(title: "Test", description: "Hier könnte Text stehen"), article: Article)
////}

//struct NewsWindow_Previews: PreviewProvider {
//    static var previews: some View {
//        // Erstellen Sie ein Beispiel des FireNewsFeed für die Vorschau
//        let exampleArticle = FireNewsFeed(id: "example_id", userId: "", title: "Example Title", description: "Example Content")
//        // Sie müssen sicherstellen, dass die NewsFeedListViewModel initialisiert wird
//        NewsWindow(article: exampleArticle)
//            .environmentObject(NewsFeedListViewModel())
//    }
//}
