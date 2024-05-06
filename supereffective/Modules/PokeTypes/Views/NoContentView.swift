//
//  NoContentView.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 02/05/2024.
//

import SwiftUI
extension PokeApi.PokeType {
    struct NoContentView: View {
        var body: some View {
            ContentUnavailableView(
                label: {
                    Label("", systemImage: "bolt.horizontal.circle")
                        .modifier(PokeBall())
                },
                description: { 
                    Text(
                        "No Pokemon types found, please try again"
                    )},
                actions: {
                    Button("PlaceHolder", action: {})
                })
        }
    }
}

#Preview {
    PokeApi.PokeType.NoContentView()
}
