//
//  ContentView.swift
//  FirstAidAssistant
//
//  Created by Madhur Gupta on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            LearningView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Learn")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
