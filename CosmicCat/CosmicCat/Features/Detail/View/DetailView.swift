//
//  DetailView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 12.03.24.
//

import SwiftUI

struct DetailView: View {
    let feedItem: FeedItem
    @State private var isFavorite: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer().frame(height: geometry.safeAreaInsets.top + 300)
                        
                        // Inhalt, der durch WebView ersetzt wird
                        VStack(alignment: .leading) {
                            HStack {
                                Image("authorAvatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                                
                                Text("Robert Fox")
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()
                                
                                Text("12 Stunden her")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding([.horizontal, .top])
                            
                            // WebView ersetzt die statische Textbeschreibung
                            WebView(url: URL(string: "https://www.gamepro.de/artikel/assassins-creed-valhalla-meteoriten,3379100.html")!)
                                .frame(height: 400)
                        }
                    }
                    .background(Color.white)
                }
                .edgesIgnoringSafeArea(.top)
                
                // Bild als Overlay
                Image(feedItem.urlToImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: 300)
                    .clipped()
                    .overlay(
                        VStack {
                            Spacer()
                            Text(feedItem.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.black.opacity(0.3))
                        },
                        alignment: .bottomLeading
                    )

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
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Dummy-FeedItem für die Vorschau
        let dummyItem = FeedItem(
            title: "Neues DLC für Valhalla führt euch in Gletscherhöhlen",
            imageName: "valhalla",
            category: "Abenteuer",
            description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        )
        
        // Zeigt die DetailView mit dem dummyItem in der Vorschau an
        DetailView(feedItem: dummyItem)
    }
}



