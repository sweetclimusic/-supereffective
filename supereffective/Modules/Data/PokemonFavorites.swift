//
//  PokemonFavorites.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 15/05/2024.
//

import Foundation
import SwiftUI
import Factory

enum FavoriteTypes: String {
    case pokemonTypes
    case pokemon
    case moves
    
    func callAsFunction() -> String {
        switch self {
        default:
            return rawValue
        }
    }
}

/// Class to manage Pokemon Type favorites stored in userdefaults in the type display
@Observable
final class PokemonTypeFavorites: FavoriteManager {
    private let storeKey: String
    private var allFavoriteTypes = Set<PokemonType>()
    
    typealias T = String
    init(storeTypeOf type: FavoriteTypes){
        storeKey = type()
    }
    func add(byId name: String) {
        allFavoriteTypes.insert(PokemonType(name: name))
    }
    
    func remove(byId name: String) {
        allFavoriteTypes.remove(PokemonType(name: name))
    }
    
    func load() {
        allFavoriteTypes = UserDefaults.standard.object(forKey: storeKey) as? Set<PokemonType> ?? Set<PokemonType>()
    }
    
    func store() {
        UserDefaults.standard.set(allFavoriteTypes, forKey: storeKey)
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: storeKey)
    }
}
