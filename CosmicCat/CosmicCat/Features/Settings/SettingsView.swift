//
//  SettingsView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 22.03.24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                VStack(spacing: 8) {
                    Text(userViewModel.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(userViewModel.email)
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
                
                List {
                    Button(role: .destructive, action: userViewModel.logout) {
                        Text("Abmelden")
                    }
                }
            }
            .navigationTitle("Einstellungen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: dismissView) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.tuerkis)
                }
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @EnvironmentObject var userViewModel: AuthenticationViewModel
    
    @Binding var sheet: Sheet?
    
    
    
    // MARK: - Functions
    
    private func dismissView() {
        sheet = nil
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sheet: .constant(nil))
    }
}
