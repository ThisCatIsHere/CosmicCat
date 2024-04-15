import SwiftUI

struct ReadingListView: View {
    @State var showBlur: Bool = true
    @StateObject var viewModel = ReadingListViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                VStack {
                    List {
                        ForEach(viewModel.articles, id: \.id) { article in
                            NavigationLink(destination: DetailView(article: article.toArticle())) {
                                CardView(showBlur: true, title: article.title, description: article.description)
                                    .padding(.vertical, 4)

                                
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    viewModel.deleteArticle(article)
                                } label: {
                                    Label("Löschen", systemImage: "trash")
                                }
                            }

                        }
                    }
                    
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: 650)
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Leseliste")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear {
                        viewModel.loadFavorits()
                    }
                }
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

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}
