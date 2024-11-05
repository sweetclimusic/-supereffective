//
//  NoContentView.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 02/05/2024.
//

import SwiftUI
extension PokeApi.PokeType {
    struct NoContentView: View {
        internal let inspection = Inspection<Self>()
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
            .onReceive(
                    inspection.notice
                ) {
                    self.inspection.visit(self,$0)
                }
        }
    }
}

#Preview {
    PokeApi.PokeType.NoContentView()
}
