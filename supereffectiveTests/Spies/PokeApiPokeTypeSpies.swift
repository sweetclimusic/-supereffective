//
//  PokeApiPokeTypeSpies.swift
//  supereffectiveTests
//
//  Created by Ashlee Muscroft on 06/05/2024.
//

import XCTest
@testable import supereffective

class PokeApiTypeBusinessLogicSpy: PokeApiTypeBusinessLogic {
    var getViewContentsCount: Int = 0
    var didGetViewContents: Bool = false
    func getViewContents() {
        getViewContentsCount += 1
        didGetViewContents = true
    }
    
    var getSelectedCount: Int = 0
    var didGetSelected: Bool = false
    
    func getSelected(for url: Int) {
        getSelectedCount += 1
        didGetSelected = true
    }
}

typealias RouterLogicSpy = PokeApiTypeRoutingLogic & PokeApiTypeDataStore
///Routing and DataStore spy for PokeApiTypeRouter class
class PokeApiTypeRouterLogicSpy: RouterLogicSpy {
    var stubbedPokemonType: String? = "Normal"
    var stubbedPokemonTypes: [PokemonType] = [
        .init(name: "Normal"),
        .init(name: "Bug"),
        .init(name: "Rock")]
    var didNavigateToPokemonOfType = false
    
    var pokemonType: String? {
        set {
            stubbedPokemonType = newValue
        }
        get {
            return stubbedPokemonType
        }
    }
    
    var pokemonTypes: [PokemonType] {
        set {
            stubbedPokemonTypes = newValue
        }
        get {
            return stubbedPokemonTypes
        }
    }
    
    func navigateToPokemonOfType() {
        didNavigateToPokemonOfType = true
    }
}

class PokeApiFetchRequestSpy: URLSessionProtocol {
    // optional, not used currently but set the stub
    var stubbedFetchedData: Data = Data()
    var stubbedResponseNone: URLResponse = URLResponse()
    
    var dataFetchRequestUrl: String? = nil
    var dataFetchRequestCount: Int = 0
    var didDataFetchRequestCount: Bool = false
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        dataFetchRequestUrl = request.url?.absoluteString
        dataFetchRequestCount += 1
        didDataFetchRequestCount = true
        //return the stubbed properties above
        return (stubbedFetchedData, stubbedResponseNone)
    }
}
