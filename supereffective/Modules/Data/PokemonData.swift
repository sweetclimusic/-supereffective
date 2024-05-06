//
//  PokemonData.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import Foundation

struct PokemonTypes: Decodable, Hashable {
    let count: Int
    let results: [PokemonType]
    
    enum CodingKeys: String, CodingKey {
        case count, results
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self )
            count = try container.decode(Int.self, forKey: .count)
            results = (try? container.decode([PokemonType].self, forKey: .results)) ?? []
        }        
    }
}
/// Pokemon Data types retrieved from the pokeapi.co, marked as codable so as to store in userdefaults. the pokeapi.co is only for get requests, we will not be encoding or posting data to a service
struct PokemonType: Codable, Identifiable, Equatable, Hashable {
    let id: UUID = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    init(from decoder: any Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self )
            name = try container.decode(String.self, forKey: .name)
            url = try container.decode(String.self, forKey: .url)
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
    
}

// MARK: CodingKey objects
struct PokemonOfTypes: Codable, Identifiable {
    var id: Int
    var name: String
    var type: PokemonType
    var primaryType: Bool
    
}

struct PokemonTypeData: Decodable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var damageRelations: DamageRelations
    
    func getNotVeryEffective() -> [String] {
        damageRelations.doubleDamageTo.map{ $0.name }
    }
    
    func getSuperEffective() -> [String] {
        damageRelations.doubleDamageFrom.map{ $0.name }
    }
}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let types = try? JSONDecoder().decode(Types.self, from: jsonData)

// MARK: - Types
struct ResourcesForType: Codable {
    let damageRelations: DamageRelations
    let id: Int
    let moveDamageClass: PokeApiStandardResultNode
    let moves: [PokeApiStandardResultNode]
    let name: String
    let pokemon: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
        case id
        case moveDamageClass = "move_damage_class"
        case moves, name, pokemon
    }
}

// MARK: - DamageRelations
struct DamageRelations: Codable {
    let doubleDamageFrom: [PokeApiStandardResultNode]
    let doubleDamageTo: [PokeApiStandardResultNode]

    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case doubleDamageTo = "double_damage_to"
    }
}

// MARK: - PokeApiNode
/// Basic result type returned from the PokeAPI, the result being a `name:String` and `url:String`
struct PokeApiStandardResultNode: Codable {
    let name: String
    let url: String
}

// MARK: - Pokemon
struct Pokemon: Codable {
    var id: Int {
        pokemon.url.idFromUrl(Endpoint.host) ?? UUID().hashValue
    }
    var name: String {
        pokemon.name
    }
    let pokemon: PokeApiStandardResultNode
    let slot: Int
    var primaryType: Bool {
        slot == 1
    }
}

