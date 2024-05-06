//
//  Namespace.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import Foundation

enum Endpoint: String {
    static let host: String = "https://pokeapi.co/api/v2/"
    case types = "type/"
    case pokemons = "pokemon/"
    
    func callAsFunction() -> String {
        let endpoint = Endpoint.host
        return endpoint.appending(rawValue)
    }
    
    func getEndpoint(with id: Int) -> String {
        self.callAsFunction().appending("\(id)")
    }
}


struct PokeApi {
    struct PokeType {}
    struct Pokemon {}
}
