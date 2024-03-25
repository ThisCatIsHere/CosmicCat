//
//  DetailView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

//import SwiftUI
//
//struct DetailView: View {
//    let article: Article
//    @State private var isFavorite: Bool = false
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .top) {
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 0) {
//                        Spacer().frame(height: geometry.safeAreaInsets.top + 300)
//
//                        // Der Inhalt, der hinter dem Bild verschwinden soll
//                        VStack(alignment: .leading) {
//                            HStack {
//                                Text(article.author ?? "Unbekannter Autor")
//                                    .font(.headline)
//                                    .foregroundColor(.secondary)
//
//                                Spacer()
//
//
//                                Text("Veröffentlichungsdatum")
//                                    .font(.subheadline)
//                                    .foregroundColor(.secondary)
//                            }
//                            .padding([.horizontal, .top])
//
//                            // Dynamische URL für WebView
//                            if let articleUrl = article.urlToImage {
//                                WebView(url: articleUrl)
//                                    .frame(height: 400)
//                            }
//                        }
//                    }
//                    .background(Color.white)
//                }
//
//                if let imageUrl = article.urlToImage {
//                    AsyncImage(url: imageUrl) { image in
//                        image.resizable()
//                        image.scaledToFit() } placeholder: {
//                            ProgressView()
//                        }
//                        .frame(width: geometry.size.width, height: 300)
//                        .clipped()
//                        .overlay(
//                            VStack {
//                                Spacer()
//                                Text(article.title)
//                                    .font(.title)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .background(Color.black.opacity(0.3))
//                            },
//                            alignment: .bottomLeading
//                        )
//                }
//
//                LoveItButton(isFavorite: $isFavorite)
//                    .frame(width: 44, height: 44)
//                    .background(Circle().fill(Color.white).shadow(radius: 4))
//                    .offset(x: 150, y: 275)
//                    .padding(.trailing)
//                    .zIndex(2)
//            }
//        }
//        .edgesIgnoringSafeArea(.top)
//        .navigationBarBackButtonHidden(false)
//        .navigationBarTitle(Text("Detail"), displayMode: .inline)
//        .navigationBarItems(leading: Button(action: {}) {
//            Image(systemName: "chevron.left")
//        }, trailing: Button(action: {}) {
//            Image(systemName: "ellipsis.circle")
//        })
//    }
//}

import SwiftUI

struct DetailView: View {
    let article: Article
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
                                Text(article.author ?? "Unbekannter Autor")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Text("12 hours ago") 
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding([.horizontal, .top])
                            
                            Text(article.description ?? "Keine Beschreibung verfügbar.")
                                
                                .padding()
                                
                        }
                    }
                    // Sorgt dafür, dass der Text auf weißem Hintergrund scrollt
                    .background(Color.white)
                }
                .edgesIgnoringSafeArea(.top)
                
                if let imageUrl = article.urlToImage {
                                   AsyncImage(url: imageUrl) { image in
                                       image.resizable()
                                       image.scaledToFit()
                                   } placeholder: {
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

                               LoveItButton(isFavorite: $isFavorite)
                                   .frame(width: 44, height: 44)
                                   .background(Circle().fill(Color.white).shadow(radius: 4))
                                   .offset(x: 150, y: 275)
                                   .padding(.trailing)
                                   .zIndex(2)
                           }
                       }
                       .edgesIgnoringSafeArea(.top)
                       .navigationBarBackButtonHidden(false)
                       .navigationBarTitle(Text("Detail"), displayMode: .inline)
                       .navigationBarItems(leading: Button(action: {}) {
                           Image(systemName: "chevron.left")
                       }, trailing: Button(action: {}) {
                           Image(systemName: "ellipsis.circle")
                       })
                   }
               }





