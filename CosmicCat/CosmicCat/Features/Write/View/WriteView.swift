import SwiftUI


struct WriteView: View {
    //    @State private var title: String = ""
    //    @State private var description: String = ""
    @StateObject private var viewModel = WriteViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                ScrollView {
                    VStack(spacing: 20) {
                        TextField("", text: $viewModel.article.title)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.tuerkis, lineWidth: 1)  // Türkiser Stroke
                            )
                        TextEditor(text: $viewModel.article.description)
                        
                            .frame(minHeight: 200)
                            .padding()
                            .foregroundColor(.white)
                            .scrollContentBackground(.hidden)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.tuerkis, lineWidth: 1)
                            )
                        
                        Button("Artikel speichern") {
//                            print(viewModel.article)
                            viewModel.saveArticle()
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


