//
//  Sheet.swift
//  CosmicCat
//
//  Created by Sarah Huth on 22.03.24.
//

import Foundation

// Definition einer Enumeration namens 'Sheet', die die Identitäten für verschiedene Ansichten (Views) darstellt.
enum Sheet: String, Identifiable {
    // Zwei Fälle der Enumeration, jeweils repräsentieren sie eine Art von Blatt (View), die angezeigt werden kann.
    case create, settings
    
    // Die 'id' Eigenschaft ist erforderlich, um das Protokoll 'Identifiable' zu erfüllen.
    // 'Identifiable' erleichtert die Handhabung dieser Enum in SwiftUI, wo eindeutige Identifikatoren benötigt werden.
    // Hier wird 'rawValue' verwendet, was den String-Wert des Enum-Falls zurückgibt.
    var id: String { rawValue }
}

