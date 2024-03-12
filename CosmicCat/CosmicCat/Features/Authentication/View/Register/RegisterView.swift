//
//  RegisterView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import SwiftUI

struct AuthenticationView: View {
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                if mode == .register {
                    ZStack(alignment: .bottom) {
                        TextField("Name", text: $name)
                            .frame(minHeight: 36)
                        
                        Divider()
                    }
                }
                
                ZStack(alignment: .bottom) {
                    TextField("E-Mail", text: $email)
                        .frame(minHeight: 36)
                    
                    Divider()
                }
                
                ZStack(alignment: .bottom) {
                    SecureField("Passwort", text: $password)
                        .frame(minHeight: 36)
                    
                    Divider()
                }
            }
            .font(.headline)
            .textInputAutocapitalization(.never)
            
            PrimaryButton(title: mode.title, action: authenticate)
                .disabled(disableAuthentication)
            
            TextButton(title: mode.alternativeTitle) {
                withAnimation {
                    switchAuthenticationMode()
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .background(.regularMaterial)
        .cornerRadius(12)
        .padding(.horizontal, 36)
        .background(
            Image("background")
                .scaledToFill()
        )
    }
    
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var mode: AuthenticationMode = .login
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    
    
    // MARK: - Computed Properties
    
    private var disableAuthentication: Bool {
        email.isEmpty || password.isEmpty
    }
    
    
    
    // MARK: - Functions
    
    private func switchAuthenticationMode() {
        mode = mode == .login ? .register : .login
    }
    
    private func authenticate() {
        switch mode {
        case .login:
            userViewModel.login(email: email, password: password)
        case .register:
            userViewModel.register(name: name, email: email, password: password)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
