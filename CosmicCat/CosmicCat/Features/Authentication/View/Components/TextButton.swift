//
//  TextButton.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import SwiftUI

struct TextButton: View {
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
    }
    
    
    
    // MARK: - Variables
    
    let title: String
    let action: () -> Void
    
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(title: "Anmelden") { }
    }
}
