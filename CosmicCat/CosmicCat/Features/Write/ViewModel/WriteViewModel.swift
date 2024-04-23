import Foundation
import Firebase

class WriteViewModel: ObservableObject {
    @Published var article: FireNewsFeed = FireNewsFeed(author: "", title: "", description: "", urlToImage: placeholderImage)
    @Published var showAlert = false
    @Published var alertMessage = ""

    func saveArticle() {
        let articleRef = FireBaseManager.shared.firestore.collection("articles").document()
        do {
            try articleRef.setData(from: self.article) { error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.alertMessage = "Fehler beim Hinzufügen des Artikels: \(error.localizedDescription)"
                    } else {
                        self.alertMessage = "Artikel erfolgreich veröffentlicht"
                    }
                    self.showAlert = true
                    self.clearFields()
                }
            }
        } catch {
            print("Error setting document: \(error)")
        }
    }
    
    func clearFields() {
        article.title = ""
        article.description = ""
    }
}


extension PublishedArticle {
    var asDictionary: [String: Any] {
        return [
            "id": id,
            "title": title,
            "description": description
        ]
    }
}
