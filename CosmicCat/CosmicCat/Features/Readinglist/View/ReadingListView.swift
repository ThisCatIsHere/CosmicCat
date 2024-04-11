
//  Created by Sarah Huth on 11.03.24.


import SwiftUI

struct ReadingListView: View {
    @State var showBlur: Bool = true
    @StateObject var viewModel = ReadingListViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationStack{
            ZStack(){
                background
                VStack{
                    ScrollView {
                        ForEach(viewModel.articles, id: \.id) { article in
                            NavigationLink(destination: DetailView(article: article.toArticle())) {
                                CardView(showBlur: true, title: article.title, description: article.description)
                                    .padding(.vertical, 4)
//                                    .swipeActions(content: <#T##() -> View#>)
                            }
                            
                    
//
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: 650)
                    .background(.clear)
                    .navigationTitle("Leseliste")
                    .navigationBarTitleDisplayMode(.inline)
                    .onAppear{
                        viewModel.loadFavorits()
                    }
                }
            }
        }
    }
}

extension ReadingListView {
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
