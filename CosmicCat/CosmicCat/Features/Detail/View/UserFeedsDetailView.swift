import SwiftUI

// SwiftUI View, die eine detaillierte Ansicht für einen Artikel in einem Benutzer-Feed darstellt.
struct UserFeedsDetailView: View {
    // Optional URL für das Artikelbild.
    var imageName: URL? = nil
    // Artikel-Datenmodell, das die Inhalte für die Anzeige liefert.
    let article: PublishedArticle
    // Zustandsvariable, die speichert, ob der Artikel als Favorit markiert ist.
    @State private var isFavorite: Bool = false
    
    var body: some View {
        GeometryReader { geometry in  // Nutzt GeometryReader, um auf die Größe und sicheren Bereiche des Geräts zuzugreifen.
            ZStack(alignment: .top) {
                ScrollView {  // Ermöglicht das Scrollen der Inhalte.
                    VStack(alignment: .leading, spacing: 0) {
                        // Erstellt einen vertikalen Abstand in Höhe der Safe Area plus 300 Pixel.
                        Spacer().frame(height: geometry.safeAreaInsets.top + 300)
                        
                        // Inhalt unterhalb des Bildes.
                        VStack(alignment: .leading) {
                            HStack {
                                Text(article.author)  // Zeigt den Autor des Artikels an.
                                    .font(.headline)
                                    .foregroundColor(.secondary)
                                
                                Spacer()  // Fügt einen flexiblen Abstand ein, um Inhalte auseinander zu schieben.
                            }
                            .padding([.horizontal, .top])
                            
                            Text(article.description)  // Zeigt die Beschreibung des Artikels.
                                .padding()
                        }
                    }
                    .background(Color.white)  // Setzt einen weißen Hintergrund für den Text.
                }
                .edgesIgnoringSafeArea(.top)
                
                // Lädt und zeigt das Artikelbild.
                AsyncImage(url: imageName) { image in
                    image.resizable()  // Erlaubt, dass das Bild skaliert wird.
                    image.scaledToFit()  // Passt das Bild so an, dass es den verfügbaren Raum ausfüllt.
                } placeholder: {
                    // Zeigt ein Platzhalterbild und eine Ladeanzeige, während das Bild geladen wird.
                    Image(.cosmiccatlogo)
                        .resizable()
                        .scaledToFill()
                    ProgressView()
                }
                .frame(width: geometry.size.width, height: 300)  // Setzt die Größe des Bildbereichs.
                .clipped()  // Beschneidet das Bild auf den Rahmen.
                .overlay(
                    // Erstellt eine Überlagerung mit dem Titel des Artikels.
                    VStack {
                        Spacer()  // Fügt einen flexiblen Abstand oben ein.
                        Text(article.title)  // Zeigt den Titel des Artikels.
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.black.opacity(0.3))  // Hintergrund mit Transparenz für bessere Lesbarkeit.
                    },
                    alignment: .bottomLeading
                )
            }
        }
    }
}
