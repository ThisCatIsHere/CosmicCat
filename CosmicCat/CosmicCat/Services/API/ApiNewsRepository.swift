//
//  ApiNewsRepository.swift
//  CosmicCat
//
//  Created by Sarah Huth on 15.03.24.
//

import Foundation

// Definition der NewsRepository-Klasse, die für das Abrufen von Nachrichtenartikeln aus einer API verantwortlich ist.
class ApiNewsRepository {
    
    // Definition eines benutzerdefinierten Fehlers für den Fall, dass eine ungültige URL erstellt wird.
    struct InvalidURLError: Error {}
    
    // Speicherung des API-Schlüssels als private Konstante innerhalb der Klasse.
    private let APIKey = "3dec2342c4574028b053547d3a2cd1c0"
    
    // Die Methode `fetchNews` ist asynchron und wirft Fehler. Sie nimmt einen Suchtext entgegen und gibt eine Liste von Artikeln zurück.
    func fetchNews(searchText: String) async throws -> [Article] {
        
        // Erstellung der URL mit dem übergebenen Suchtext und dem API-Schlüssel.
        // Falls die URL nicht korrekt erstellt werden kann, wird ein `InvalidURLError` geworfen.
        guard let url = URL(string:"https://newsapi.org/v2/everything?q=gaming&sortBy=publishedAt&apiKey=\(APIKey)") else {
            
            
           
            throw InvalidURLError()
        }
        
        // Durchführung des Netzwerkaufrufs, um die Daten von der generierten URL zu erhalten.
        // Dies geschieht asynchron und könnte Fehler werfen.
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Dekodierung der erhaltenen Daten in eine Instanz von `NewsResponse` mithilfe von `JSONDecoder`.
        // Dies könnte ebenfalls Fehler werfen, falls die Daten nicht dem erwarteten Format entsprechen.
        let newsResult = try JSONDecoder().decode(FeedItem.self, from: data)
        print("Repo",newsResult.articles)
        // Rückgabe der Artikel aus dem dekodierten `NewsResponse` Objekt.
        
//        var articles: [Article] = []
//        for oneArticle in newsResult.articles {
//            if let unwrappedArticle = oneArticle {
//                articles.append(unwrappedArticle)
//            }
//        }
        return newsResult.articles
    }
}
