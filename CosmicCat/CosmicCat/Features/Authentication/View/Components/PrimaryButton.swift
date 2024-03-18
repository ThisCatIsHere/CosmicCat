//
//  PrimaryButton.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import SwiftUI

struct PrimaryButton: View {
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
                
                
        }
        .frame(width: 200, height: 45)
        .background(LinearGradient(
            gradient: Gradient(colors: [.pinky.opacity(0.75),.hellblau, .tuerkis]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
        .clipShape(
            .rect(
                topLeadingRadius: 20.0,
                bottomLeadingRadius: 10.0,
                bottomTrailingRadius: 20.0,
                topTrailingRadius: 10.00
                )
        )
        .shadow(radius: 5)
    }
    
    
    
    let title: String
    let action: () -> Void
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Login") { }
    }
}


