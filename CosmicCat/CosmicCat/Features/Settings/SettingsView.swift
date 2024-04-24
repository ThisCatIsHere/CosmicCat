//
//  SettingsView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 22.03.24.
//

import SwiftUI

// Definition der SettingsView, die eine SwiftUI View darstellt.
struct SettingsView: View {
    var body: some View {
        // Verwendung von NavigationStack für eine navigierbare Oberfläche.
        NavigationStack {
            VStack(spacing: 0) {
                // Anzeige des Namens und der E-Mail des Nutzers, jeweils in einem eigenen Textfeld.
                VStack(spacing: 8) {
                    Text(userViewModel.name)  // Anzeige des Namens mit Überschrift-Stil.
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(userViewModel.email) // Anzeige der E-Mail mit kleinerer Schrift.
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
                
                // Erstellung einer Liste mit einer Abmelden-Schaltfläche.
                List {
                    Button(role: .destructive, action: userViewModel.logout) {
                        Text("Abmelden")
                    }
                }
            }
            .navigationTitle("Einstellungen")  // Setzt den Titel der Navigationsleiste.
            .navigationBarTitleDisplayMode(.inline)  // Stellt den Titel inline dar.
            .toolbar {
                // Schaltfläche zum Schließen der Einstellungsansicht.
                Button(action: dismissView) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.tuerkis)
                }
            }
        }
    }
    // Deklaration der benötigten Umgebungs- und Bindungsvariablen.
    @EnvironmentObject var userViewModel: AuthenticationViewModel  // Verweis auf das Benutzer-ViewModel.
    @Binding var sheet: Sheet?  // Bindung zur Steuerung des sichtbaren Zustands des Blatts.
    
    // Funktion zum Schließen der Ansicht.
    private func dismissView() {
        sheet = nil
    }
}
// Vorschau der SettingsView für die Entwicklungsumgebung.
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sheet: .constant(nil))
    }
}

