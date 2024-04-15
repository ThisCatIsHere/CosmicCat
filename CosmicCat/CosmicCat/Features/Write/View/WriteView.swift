import SwiftUI

// Eine UIViewRepresentable Struktur, um die Darstellung des UITextView zu beeinflussen
struct TransparentTextEditor: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.textColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = text
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
struct WriteView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                ScrollView {
                    VStack(spacing: 20) {
                        TextField("", text: $title)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.tuerkis, lineWidth: 1)  // Türkiser Stroke
                            )
                        TransparentTextEditor(text: $description)
                            .frame(minHeight: 200)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.tuerkis, lineWidth: 1)
                            )
                        
                        Button("Artikel speichern") {
                            saveArticle(title: title, description: description)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.tuerkis, lineWidth: 1)
                        )
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Artikel erstellen")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func saveArticle(title: String, description: String) {
        print("Artikel gespeichert: \(title) - \(description)")
    }
    
    var background: some View {
        GeometryReader { geo in
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}


