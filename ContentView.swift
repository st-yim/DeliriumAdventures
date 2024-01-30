// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ColorMatchView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }


            CardMatchView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            

            PhotoTriviaView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            //FunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
        
    }
}


