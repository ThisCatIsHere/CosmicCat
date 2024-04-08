//
//  CardView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 26.03.24.
//

import SwiftUI

// Anpassung der CardView, um Artikelinformationen anzuzeigen
struct CardView: View {
    let showBlur: Bool
    let title: String
    let description: String
    
    private var gaussianBlurRadius: CGFloat {
        showBlur ? 11 : 0
    }
    
    private func shortenDescription(_ description: String, toLength length: Int = 50) -> String {
        guard description.count > length else { return description }
        return String(description.prefix(length)) + "..."
    }
    
    var body: some View {
        let shortDescription = shortenDescription(description)
        VStack {
            VStack{
                Text(title)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, maxHeight: 50)
//            .background(.red)
            
            
            VStack{
                Text(description)
                    .fontWeight(.thin)
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, maxHeight: 100)
//            .background(.blue)
        }
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.black).opacity(0.8)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.tuerkis, lineWidth: 1)
        )
        
        
       
        
    }
    
    // Angepasster cardContent, um dynamische Inhalte anzuzeigen
    func cardContent(title: String, description: String) -> some View {
        VStack(alignment: .center, spacing: 12) {
            Text(title)
                .foregroundColor(.tuerkis)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .kerning(2.0)
                .shadow(radius: 15)
                .padding()
            
            Text(description)
                .foregroundColor(.tuerkis)
                .font(.title)
                .shadow(radius: 15)
                .padding()
            
            // Hier könntest du weitere Ansichten hinzufügen, die auf den Artikel bezogen sind, z.B. ein Bild
            
            Spacer()
        }
        .foregroundColor(.tuerkis)
        .blendMode(.overlay)
    }
    
    // Der Rest der CardView-Definition bleibt unverändert
}


extension CardView {
    var cardBorders: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .stroke(
                .linearGradient(colors: [
                    .tuerkis.opacity(0.6),
                    .clear,
                    .gray.opacity(0.2),
                    .gray.opacity(0.5)
                ], startPoint: .topLeading, endPoint: .bottomTrailing),
                lineWidth: 2
            )
    }
}

extension CardView {
    struct BlurView: UIViewRepresentable {
        let effect: UIBlurEffect.Style
        let gaussianBlurRadius: CGFloat
        
        func makeUIView(context: Context) -> UIVisualEffectView {
            let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
            return view
        }
        
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            DispatchQueue.main.async {
                uiView.gaussianBlurRadius = gaussianBlurRadius
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(showBlur: true, title: "Test", description: "Blabla")
    }
}
