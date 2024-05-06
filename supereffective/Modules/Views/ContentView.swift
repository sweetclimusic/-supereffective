//
//  ContentView.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import SwiftUI



struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            NavigationLink("Explore Pokemon types") {
                AnyView(PokemonTypeScene.types.view)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
