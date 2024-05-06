//
//  DisplayableSceneViews.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 02/05/2024.
//

import SwiftUI

enum PokemonTypeScene {
    case types
    case doubleDamageTo(pokemonType: String)
    case doubleDamageFrom(pokemonType: String)
    case pokemonWithAdvantage(pokemonType: Int)
    case pokemonWithDisAdvantage(pokemonType: Int)

    var displayable: Displayable {
        switch self {
        case .types:
            return PokeApi.PokeType.Router()
        case .doubleDamageTo(let pokemonType):
            return PokeApi.PokeType.Router(pokemonType: pokemonType)
        case .doubleDamageFrom(let pokemonType):
            return PokeApi.PokeType.Router(pokemonType: pokemonType)
        case .pokemonWithAdvantage(let pokemonType):
            return PokeApi.Pokemon.Router(pokemonType: pokemonType)
        case .pokemonWithDisAdvantage(let pokemonType):
            return PokeApi.Pokemon.Router(pokemonType: pokemonType, hasAdvantage: false)
        }
    }
    
    var view: any View {
        displayable.setupDisplayable()
    }
    
    var viewType: any View.Type {
        displayable.viewType
    }
}
