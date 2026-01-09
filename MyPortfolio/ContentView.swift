//
//  ContentView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            NavigationView {
                HomeView()
            }
                .tabItem {
                    Image(systemName: "music.note")
                }
        }
    }
}

#Preview {
    ContentView()
}
