//
//  LoveItButton.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//
import SwiftUI

struct LoveItButton: View {
    let article: Article
    
    @Binding var isFavorite: Bool

    @EnvironmentObject var viewModel: NewsFeedListViewModel
    
    var body: some View {
        Button(action: {
            self.isFavorite.toggle()
            viewModel.saveArticle(article.toFireNewsFeed())
        }) {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 44, height: 44)
                    .shadow(radius: 10)

                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.white)
                    .font(.system(size: 20)) 
                    .scaleEffect(isFavorite ? 1.0 : 0.8)
            }
        }
        .animation(.easeInOut, value: isFavorite)
    }
}

//struct LoveItButton_Previews: PreviewProvider {
//    static var previews: some View {
//        LoveItButton(article: <#Article#>, isFavorite: .constant(false))
//    }
//}


