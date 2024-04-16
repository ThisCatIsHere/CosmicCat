//
//  UserViewModel.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    
    init() {
        checkAuth()
    }
    
    
    
    
    private let firebaseManager = FireBaseManager.shared
    
    @Published var user: FireUser?
    
    
    
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    var name: String {
        user?.name ?? ""
    }
    
    var email: String {
        user?.email ?? ""
    }
    
    
    
    // MARK: - Functions
    
    /**
     Überprüfen, ob aktuell ein User angemeldet ist. Falls ja, wird der User gesetzt.
     
     Sollte bei jedem App-Start ausgeführt werden.
     */
    private func checkAuth() {
        guard let currentUser = firebaseManager.authenticator.currentUser else {
            print("Not logged in")
            return
        }
        
        self.fetchUser(with: currentUser.uid)
    }
    
    /**
     Zum Login nehmen wir E-Mail und Passwort. Falls kein Error entsteht, setzen wir den neu angemeldeten User.
     */
    func login(email: String, password: String) {
        firebaseManager.authenticator.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    /**
     Bei der Registrierung übergeben wir E-Mail und Passwort. Falls kein Error entsteht, führen wir nach der Registrierung einen Login durch (das passiert nicht automatisch).
     
     Normalerweise würden wir an dieser Stelle auch ein User-Objekt in unserem Firestore erstellen. Das kommt in der nächsten Vorlesung.
     */
    func register(name: String, email: String, password: String) {
        firebaseManager.authenticator.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            self.createUser(with: authResult.user.uid, name: name, email: email)
            
            // Nach der Registrierung möchten wir unseren User auch direkt anmelden.
            // Dazu können wir einfach die login()-Funktion aufrufen und E-Mail und Passwort weitergeben
            self.login(email: email, password: password)
        }
    }
    
    /**
     Der Logout entfernt den aktuellen User und wir setzen unsere User-Variable ebenfalls nil.
     */
    func logout() {
        do {
            try firebaseManager.authenticator.signOut()
            self.user = nil
            
            print("User wurde abgemeldet!")
        } catch {
            print("Error signing out: ", error.localizedDescription)
        }
    }
    
}



// MARK: Data

extension AuthenticationViewModel {
    
    /**
     Erstellen eines User-Dokuments im Firestore.
     
     Als 'registeredAt' setzen wir das Datum für den Moment, in dem die Registrierung statt findet.
     
     In der Collection 'users' wird unter der jeweiligen ID des Users ein Dokument erstellt. Dazu kann das Objekt übergeben werden.
     */
    private func createUser(with id: String, name: String, email: String) {
        let user = FireUser(id: id, name: name, email: email, registeredAt: Date(), publishedArticle: [])
        
        do {
            try firebaseManager.firestore.collection("users").document(id).setData(from: user)
        } catch let error {
            print("Fehler beim Speichern des Users: \(error)")
        }
    }
    
    /**
     Der User wird mit der ID geladen, die der auf dem Gerät angemeldete User hat.
     
     Das Dokument, das geladen wird, wird zu einem 'FireUser' und 'user' wird angeschließend gesetzt.
     
     Hinweis: Hier gibt es noch keinen Listener, d.h. es findet kein Echtzeit-Sync statt, das kommt in der nächsten Vorlesung (Teil 4).
     */
    private func fetchUser(with id: String) {
        firebaseManager.firestore.collection("users").document(id).getDocument { document, error in
            if let error {
                print("Fetching user failed:", error.localizedDescription)
                return
            }
            
            guard let document else {
                print("Dokument existiert nicht!")
                return
            }
            
            do {
                let user = try document.data(as: FireUser.self)
                self.user = user
            } catch {
                print("Dokument ist kein User", error.localizedDescription)
            }
        }
    }
}
