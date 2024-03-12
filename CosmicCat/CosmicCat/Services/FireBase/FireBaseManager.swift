//
//  FireBaseManager.swift
//  CosmicCat
//
//  Created by Sarah Huth on 10.03.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FireBaseManager {
   
  static let shared = FireBaseManager()
   
  let authenticator = Auth.auth()
  let firestore = Firestore.firestore()
   
  var userId: String? {
      authenticator.currentUser?.uid
  }
   
  private init(){}
   
}
