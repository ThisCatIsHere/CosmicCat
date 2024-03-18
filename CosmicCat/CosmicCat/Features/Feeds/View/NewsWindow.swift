//
//  NewsWindow.swift
//  CosmicCat
//
//  Created by Sarah Huth on 13.03.24.
//

import SwiftUI

struct NewsWindow: View {
    var category = ""
    var imageName = ""
    var title = ""
    var description = ""
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 300, height: 150)
                    .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.tuerkis)
            
            Text(category)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white)
            
            Text(description)
                .multilineTextAlignment(.leading)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(3)
        }
        .frame(width: 300, height: 250)
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(12)
    }
    
}

#Preview {
    NewsWindow()
}
