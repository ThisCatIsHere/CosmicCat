//
//  FireBaseManager.swift
//  CosmicCat
//
//  Created by Sarah Huth on 10.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

// Zentraler Manager für Firebase-Operationen innerhalb der App.
class FireBaseManager {
    
    // Singleton-Instanz des Managers, um von überall in der App darauf zugreifen zu können.
    // Nur eine Instanz der Klasse, welche aber durch die shared-Eigenschaft von überall aus aufgerufern werden kann.
    static let shared = FireBaseManager()
    
    // Firebase Authentifizierungsobjekt zur Verwaltung von Benutzer-Authentifizierungsstatus.
    let authenticator = Auth.auth()
    // Firebase Firestore-Objekt zur Verwaltung von Datenbankoperationen.
    //Das firestore-Objekt ermöglicht den Zugriff auf die Firestore-Datenbank für CRUD-Operationen (Create, Read, Update, Delete) auf dokumentbasierte Daten.
    let firestore = Firestore.firestore()
    
    // Aktuelle Benutzer-ID, abgeleitet aus dem aktuellen Authentifizierungsstatus.
    var userId: String? {
        authenticator.currentUser?.uid
    }
    
    // Privater Initialisierer verhindert die Erstellung weiterer Instanzen dieser Klasse,
    // um die Einzigartigkeit der Singleton-Instanz zu gewährleisten.
    private init(){}
    
}
