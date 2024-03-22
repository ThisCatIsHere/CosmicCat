//
//  Sheet.swift
//  CosmicCat
//
//  Created by Sarah Huth on 22.03.24.
//

import Foundation

enum Sheet: String, Identifiable {
    case create, settings
    
    var id: String { rawValue }
}
