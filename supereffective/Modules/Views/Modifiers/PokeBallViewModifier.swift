//
//  SwiftUIView.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 02/05/2024.
//

import SwiftUI

/// Makes a gradient colors to the system Image to resemble the standard Pokeball
struct PokeBall: ViewModifier {
    var fontSize: Font = .title
    func body(content: Content) -> some View {
        content
            .font(fontSize)
            .symbolRenderingMode(.palette)
            .foregroundStyle(
                .linearGradient(colors: [.black,.white,.black], startPoint: .leading, endPoint: .trailing),
                .linearGradient(colors: [.red,.white,.blue], startPoint: .top, endPoint: .bottom)
            )
    }
}

struct SuperEffective: ViewModifier {
    var isSuperEffective: Bool = false
    var isNotEffective: Bool = false
    @ViewBuilder
    func superEffectiveText(_ content: Self.Content) -> some View {
        var color: Color = isSuperEffective ? .mint : ( isNotEffective ? .gray : .clear)
        content
            .padding(EdgeInsets(top: 4,leading: 4,bottom: 0,trailing: 0))
            .font(.caption)
            .italic()
            .tracking(2)
            .foregroundStyle(color)
    }
    
    func body(content: Self.Content) -> some View {
        superEffectiveText(content)
    }
}
