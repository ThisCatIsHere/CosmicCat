import Foundation
import FirebaseAuth

// ViewModel zur Verwaltung der Benutzerauthentifizierung in einer App, nutzt Firebase für die Authentifizierung.
class AuthenticationViewModel: ObservableObject {
    
    // Initialisierung, die überprüft, ob bereits ein Benutzer angemeldet ist.
    init() {
        checkAuth()
    }
    
    // Ein shared Manager für die Verwaltung von Firebase Operationen.
    private let firebaseManager = FireBaseManager.shared
    
    // Aktuell angemeldeter Benutzer, wird in der App-Oberfläche beobachtet.
    @Published var user: FireUser?
    
    // Prüft, ob ein Benutzer angemeldet ist, basierend auf der Verfügbarkeit des Benutzerobjekts.
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    // Bereitstellung des Benutzernamens, mit Fallback auf einen leeren String, falls kein Benutzer angemeldet ist.
    var name: String {
        user?.name ?? ""
    }
    
    // Bereitstellung der Benutzer-E-Mail, mit Fallback auf einen leeren String.
    var email: String {
        user?.email ?? ""
    }
    
    // MARK: - Functions
    
    // Überprüft die Authentifizierung beim Start der App und setzt den Benutzer entsprechend.
    private func checkAuth() {
        guard let currentUser = firebaseManager.authenticator.currentUser else {
            print("Not logged in")
            return
        }
        self.fetchUser(with: currentUser.uid)
    }
    
    // Versucht, den Benutzer mit gegebenen E-Mail und Passwort anzumelden.
    func login(email: String, password: String) {
        firebaseManager.authenticator.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Login failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            // Lädt Benutzerdaten nach erfolgreicher Anmeldung.
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    // Registriert einen neuen Benutzer und meldet ihn direkt an.
    func register(name: String, email: String, password: String) {
        firebaseManager.authenticator.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            // Erstellt ein Benutzerprofil in der Datenbank.
            self.createUser(with: authResult.user.uid, name: name, email: email)
            
            // Meldet den Benutzer direkt nach der Registrierung an.
            self.login(email: email, password: password)
        }
    }
    
    // Meldet den aktuellen Benutzer ab.
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
    
    // Erstellt ein neues Benutzerdokument in Firestore.
    private func createUser(with id: String, name: String, email: String) {
        let user = FireUser(id: id, name: name, email: email, registeredAt: Date(), publishedArticle: [])
        
        do {
            try firebaseManager.firestore.collection("users").document(id).setData(from: user)
        } catch let error {
            print("Fehler beim Speichern des Users: \(error)")
        }
    }
    
    // Lädt Benutzerdaten aus Firestore.
    private func fetchUser(with id: String) {
        firebaseManager.firestore.collection("users").document(id).getDocument { document, error in
            if let error = error {
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
                print("Dokument ist kein User",error.localizedDescription)
                      }
                    }
                }
            }
