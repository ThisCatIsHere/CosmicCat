import SwiftUI

// Die DetailView zeigt detaillierte Informationen zu einem Artikel an.
struct DetailView: View {
    let article: Article  // Artikel-Instanz, die detaillierte Informationen enthält.
    @State private var isFavorite: Bool = false  // State-Variable, die den Favoritenstatus des Artikels speichert.
    
    var body: some View {
        GeometryReader { geometry in  // GeometryReader zur Handhabung der Layout-Größe.
            ZStack(alignment: .top) {  // ZStack für überlappende Inhalte.
                ScrollView {  // Ermöglicht das Scrollen des Inhalts.
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer().frame(height: geometry.safeAreaInsets.top + 300)
                        
                        // Inhalt unter dem Bild.
                        VStack(alignment: .leading) {
                            HStack {
                                Text(article.author ?? "Unbekannter Autor")  // Zeigt den Autor des Artikels an.
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()  // Schiebt den nächsten Text nach rechts.
                                
                                Text("12 hours ago")  // Statische Zeitangabe (könnte dynamisch sein).
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding([.horizontal, .top])
                            
                            Text(article.description ?? "Keine Beschreibung verfügbar.")  // Artikelbeschreibung.
                                .padding()
                        }
                    }
                    .background(Color.white)  // Hintergrundfarbe des Textblocks.
                }
                .edgesIgnoringSafeArea(.top)
                
                // Bild des Artikels, wenn vorhanden.
                if let imageUrl = article.urlToImage {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                        image.scaledToFit()
                    } placeholder: {
                        ProgressView()  // Ladeanzeige, während das Bild geladen wird.
                    }
                    .frame(width: geometry.size.width, height: 300)
                    .clipped()
                    .overlay(
                        VStack {
                            Spacer()
                            Text(article.title ?? "No title found")  // Titel des Artikels.
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.black.opacity(0.3))  // Semitransparenter Hintergrund für bessere Lesbarkeit.
                        },
                        alignment: .bottomLeading
                    )
                }

                // Lieblingsbutton für den Artikel.
                LoveItButton(article: article, isFavorite: $isFavorite)
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(Color.white).shadow(radius: 4))
                    .offset(x: 150, y: 275)
                    .padding(.trailing)
                    .zIndex(2)
            }
        }
        .edgesIgnoringSafeArea(.top)  // Ignoriert die oberen Safe Area-Grenzen für das Layout.
        .navigationBarTitle(Text("Detail"), displayMode: .inline)  // Navigationsbalken-Titel.
    }
}
