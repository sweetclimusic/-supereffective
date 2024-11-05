//
//  ThemeColors.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 05/05/2024.
//

import Foundation

import SwiftUI

struct ColorStruct {
    var light: Color
    var dark: Color
    
    var color: Color {
       let colorScheme = UIApplication.shared.connectedScenes.first?.inputView?.traitCollection.userInterfaceStyle.rawValue ?? 0
        return SwiftUI.ColorScheme(UIUserInterfaceStyle(rawValue:colorScheme)!) == .dark ? dark : light
    }
}

enum PokemonTypeTheme: String {
    case normal,
         fire,
         water,
         electric,
         grass,
         ice,
         fighting,
         poison,
         ground,
         flying,
         psychic,
         bug,
         rock,
         ghost,
         dragon,
         dark,
         steel,
         fairy,
         unknown
   
    var themeColor: ColorStruct {
        switch self {
        case .normal:
            return ColorStruct(
                light: Color(red: 168/255, green: 168/255, blue: 120/255),
                dark: Color(red: 112/255, green: 112/255, blue: 88/255)
            )
        case .fire:
            return ColorStruct(
                light: Color(red: 240/255, green: 128/255, blue: 48/255),
                dark: Color(red: 184/255, green: 80/255, blue: 32/255)
            )
        case .water:
            return ColorStruct(
                light: Color(red: 104/255, green: 144/255, blue: 240/255),
                dark: Color(red: 64/255, green: 104/255, blue: 208/255)
            )
        case .electric:
            return ColorStruct(
                light: Color(red: 248/255, green: 208/255, blue: 48/255),
                dark: Color(red: 208/255, green: 168/255, blue: 32/255)
            )
        case .grass:
            return ColorStruct(
                light: Color(red: 120/255, green: 200/255, blue: 80/255),
                dark: Color(red: 80/255, green: 160/255, blue: 64/255)
            )
        case .ice:
            return ColorStruct(
                light: Color(red: 152/255, green: 216/255, blue: 216/255),
                dark: Color(red: 120/255, green: 184/255, blue: 184/255)
            )
        case .fighting:
            return ColorStruct(
                light: Color(red: 192/255, green: 48/255, blue: 40/255),
                dark: Color(red: 128/255, green: 32/255, blue: 24/255)
            )
        case .poison:
            return ColorStruct(
                light: Color(red: 160/255, green: 64/255, blue: 160/255),
                dark: Color(red: 112/255, green: 72/255, blue: 112/255)
            )
        case .ground:
            return ColorStruct(
                light: Color(red: 224/255, green: 192/255, blue: 104/255),
                dark: Color(red: 160/255, green: 128/255, blue: 72/255)
            )
        case .flying:
            return ColorStruct(
                light: Color(red: 168/255, green: 144/255, blue: 240/255),
                dark: Color(red: 112/255, green: 104/255, blue: 248/255)
            )
        case .psychic:
            return ColorStruct(
                light: Color(red: 248/255, green: 88/255, blue: 136/255),
                dark: Color(red: 184/255, green: 72/255, blue: 120/255)
            )
        case .bug:
            return ColorStruct(
                light: Color(red: 168/255, green: 184/255, blue: 32/255),
                dark: Color(red: 112/255, green: 120/255, blue: 24/255)
            )
        case .rock:
            return ColorStruct(
                light: Color(red: 184/255, green: 160/255, blue: 56/255),
                dark: Color(red: 128/255, green: 112/255, blue: 40/255)
            )
        case .ghost:
            return ColorStruct(
                light: Color(red: 112/255, green: 88/255, blue: 152/255),
                dark: Color(red: 80/255, green: 64/255, blue: 128/255)
            )
        case .dragon:
            return ColorStruct(
                light: Color(red: 112/255, green: 56/255, blue: 248/255),
                dark: Color(red: 72/255, green: 48/255, blue: 160/255)
            )
        case .dark:
            return ColorStruct(
                light: Color(red: 112/255, green: 88/255, blue: 72/255),
                dark: Color(red: 72/255, green: 56/255, blue: 48/255)
            )
        case .steel:
            return ColorStruct(
                light: Color(red: 184/255, green: 184/255, blue: 208/255),
                dark: Color(red: 136/255, green: 136/255, blue: 160/255)
            )
        case .fairy:
            return ColorStruct(
                light: Color(red: 238/255, green: 153/255, blue: 172/255),
                dark: Color(red: 170/255, green: 102/255, blue: 119/255)
            )
        case .unknown:
            return ColorStruct(light: .gray, dark: .gray)
        }
    }
}

extension PokemonTypeTheme {
    func callAsFunction() -> Color {
        return self.themeColor.color
    }
}
