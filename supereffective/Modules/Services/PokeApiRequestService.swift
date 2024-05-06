//
//  PokeApiRequestService.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import Foundation
enum NoResultsError: Error {
    case dateInvalidShowErrorView
}
enum PokeApiEndpoints: Sendable {
    
    case types
    case type(id: Int?)
    
    func callAsFunction() -> URL {
        switch self {
        case .types:
            return URL(string: Endpoint.types())!
        case .type(let id):
            guard let id
            else {
                return URL(string: Endpoint.types())!
            }
            return URL(string: Endpoint.types.getEndpoint(with: id))!
        }
    }
}

protocol PokeApiGetService {
    var urlSession: URLSessionProtocol { get }
    var cachePolicy: NSURLRequest.CachePolicy { get }
    
    func getTypes() async throws -> [PokemonType]
    func getType(by id: Int) async throws -> PokemonTypeData
    /// Uses the cache or fetch the types found in 'double_damage_from' types
    ///
    /// **Parameter:** against: String
    ///
    /// **Return:** [String]
    ///
    ///  - filters the data returning an array of types the current type is super effective against
    func findSuperEffectiveTypes(against type: String) -> [String]
}

/// Retrieves types and looks ups they types which has double damage modifiers
///  double_damage_to and double_damage_from from the PokeApi.co
final class PokeTypesService: PokeApiGetService {
    var urlSession: URLSessionProtocol = URLSession.shared
    var cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad
    
    
    func getTypes() async throws -> [PokemonType]{
        do {
            let pokeApiEnpoint: PokeApiEndpoints = .types
            let request = URLRequest(url: pokeApiEnpoint(), cachePolicy: cachePolicy)
            // ignoring response as no data,just show the empty view state should be returned to the user.
            let(data,_) = try await urlSession.data(for: request)
            let decoder = JSONDecoder()
            let pokeTypes = try decoder.decode(PokemonTypes.self, from: data)
            return pokeTypes.results
        } catch {
            throw NoResultsError.dateInvalidShowErrorView
        }
    }
    
    func getType(by id: Int) async throws -> PokemonTypeData {
        do {
            let pokeApiEnpoint: PokeApiEndpoints = .type(id: id)
            let request = URLRequest(url: pokeApiEnpoint(), cachePolicy: cachePolicy)
            let (data,_) = try await urlSession.data(for: request)
            let decoder = JSONDecoder()
            let pokeTypes = try decoder.decode(ResourcesForType.self, from: data)
            return .init(name: pokeTypes.name, damageRelations: pokeTypes.damageRelations)
        } catch {
            throw NoResultsError.dateInvalidShowErrorView
        }
    }
    
    
    func findSuperEffectiveTypes(against type: String) -> [String] {
        [String]()
    }
}
