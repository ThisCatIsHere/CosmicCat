//
//  ProfileView.swift
//  CosmicCat
//
//  Created by Sarah Huth on 11.03.24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            
            
            ZStack{
                Image(.background)
                    .resizable()
                
                
                Text("Profil")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.thin)
                    .foregroundColor(.white)
                    
                    
      
                
                
                
            }.ignoresSafeArea(.all, edges: [.bottom, .top])
            
        }
    }
}

#Preview {
    ProfileView()
}
