//
//  RegisterView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import SwiftUI

// Eine SwiftUI View zur Handhabung der Benutzerauthentifizierung.
struct AuthenticationView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            // Der innere VStack enthält die Eingabefelder für die Benutzerdaten.
            VStack(spacing: 12) {
                // Zeigt das Namenseingabefeld nur im Registrierungsmodus.
                if mode == .register {
                    ZStack(alignment: .bottom) {
                        TextField("Name", text: $name)
                            .frame(minHeight: 36)
                        
                        Divider()  // Visuelle Trennung des Textfeldes.
                    }
                }
                
                // Eingabefeld für die E-Mail-Adresse.
                ZStack(alignment: .bottom) {
                    TextField("E-Mail", text: $email)
                        .frame(minHeight: 36)
                    
                    Divider()
                }
                
                // Eingabefeld für das Passwort, hier als SecureField, um Eingaben zu verbergen.
                ZStack(alignment: .bottom) {
                    SecureField("Passwort", text: $password)
                        .frame(minHeight: 36)
                    
                    Divider()
                }
            }
            .font(.headline)  // Setzt die Schriftart für alle Textfelder.
            .textInputAutocapitalization(.never)  // Verhindert die automatische Großschreibung.
            
            // Ein Button, der die Authentifizierung ausführt.
            PrimaryButton(title: mode.title, action: authenticate)
                .disabled(disableAuthentication)  // Deaktiviert den Button, wenn die Felder nicht ausgefüllt sind.
            
            // Button zum Wechseln zwischen Anmelde- und Registrierungsmodus.
            TextButton(title: mode.alternativeTitle) {
                withAnimation {
                    switchAuthenticationMode()
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(.regularMaterial)  // Legt ein Standardmaterial als Hintergrund.
        .cornerRadius(12)
        .padding(.horizontal, 36)
        .background(
            Image("background")
                .scaledToFill()  // Füllt den Hintergrund mit einem Bild.
        )
    }
    
    // MARK: - Variables
    
    // Umgebungsobjekt zur Verwaltung der Authentifizierung.
    @EnvironmentObject private var userViewModel: AuthenticationViewModel
    
    // Lokale Zustandsvariablen für den Modus und die Benutzerdaten.
    @State private var mode: AuthenticationMode = .login
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    // MARK: - Computed Properties
    
    // Gibt an, ob die Authentifizierungsschaltfläche deaktiviert werden sollte.
    private var disableAuthentication: Bool {
        email.isEmpty || password.isEmpty
    }
    
    // MARK: - Functions
    
    // Wechselt zwischen Anmelde- und Registrierungsmodus.
    private func switchAuthenticationMode() {
        mode = mode == .login ? .register : .login
    }
    
    // Führt die Authentifizierung basierend auf dem aktuellen Modus aus.
    private func authenticate() {
        switch mode {
        case .login:
            userViewModel.login(email: email, password: password)
        case .register:
            userViewModel.register(name: name, email: email, password: password)
        }
    }
}

// SwiftUI Preview für die Entwicklungsphase.
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
