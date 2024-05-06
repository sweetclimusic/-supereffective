//
//  supereffectiveTests.swift
//  supereffectiveTests
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import XCTest
import SwiftUI
@testable import supereffective

final class supereffectiveTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_pokemonType_decoderWithExpected () throws {
        let pokemonData = pokemonTypeJSON()
        do {
            let decoder = JSONDecoder()
            let pokemonTypes = try decoder.decode(PokemonTypes.self, from: pokemonData)
            XCTAssertEqual(pokemonTypes.results[0].name, "Normal")
            XCTAssertEqual(pokemonTypes.results[1].name, "Flying")
            XCTAssertEqual(pokemonTypes.results[2].name, "Poison")
            XCTAssertEqual(pokemonTypes.results[3].name, "Ice")
        }
        catch let DecodingError.dataCorrupted(context) {
            print(context)
            return XCTFail("Failed to decode mock JSON")
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return XCTFail("Failed to decode mock JSON")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return XCTFail("Failed to decode mock JSON")
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            return XCTFail("Failed to decode mock JSON")
        } catch {
            print("error: ", error)
            return XCTFail("Failed to decode mock JSON")
        }
    }
    
    func test_expectedEndpoint_forTypes() throws {
        XCTAssertEqual(Endpoint.types(), "https://pokeapi.co/api/v2/type/")
    }
    
    func test_indexFromURL_intExtracted() throws {
        //Given
        let endpoint = Endpoint.pokemons() + "16"
        //When
        let result = endpoint.idFromUrl(Endpoint.pokemons())
        //Then
        XCTAssertEqual(result, 16)
    }

    func test_pokemonType_hasCorrectColorScheme() throws {
        //Given
        let bugScheme = PokemonTypeTheme(rawValue: "bug")
        //When
        let damageRelationsForBugs = PokeApi.PokeType.ViewContents.DamageRelationViewModel(
            type: "Bug",
            
            types: [
                "bug",
                "normal"
            ],
            superEffective: [String](),
            notVeryEffective: [String]()
        )
        let simulatorColorScheme: Int = UIApplication.shared.connectedScenes.first?.inputView?.traitCollection.userInterfaceStyle.rawValue ?? 0
        
        //Then
        if SwiftUI.ColorScheme(UIUserInterfaceStyle(rawValue: simulatorColorScheme)!) == .dark {
            XCTAssertEqual(damageRelationsForBugs.theme, SwiftUI.Color(red: 112/255, green: 120/255, blue: 24/255))
        } else {
            XCTAssertEqual(damageRelationsForBugs.theme, SwiftUI.Color(red: 168/255, green: 184/255, blue: 32/255))
        }
    }
    
    // MARK: Test stubs {
    
    func pokemonTypeJSON() -> Data {
        let pokemonTypeJSON = """
{
      "count": 21,
      "next": "https://pokeapi.co/api/v2/type/?offset=20&limit=1",
      "previous": null,
      "results": [
    {
        "name" : "Normal",
        "url" : "https://pokeapi.co/api/v2/type/2/"
    },
    {
        "name" : "Flying",
        "url" : "https://pokeapi.co/api/v2/type/2/"
    },
    {
        "name" : "Poison",
        "url" : "https://pokeapi.co/api/v2/type/2/"
    },
    {
        "name" : "Ice",
        "url" : "https://pokeapi.co/api/v2/type/2/"
    }]
}
"""
        return pokemonTypeJSON.data(using: .utf8) ?? Data()
        
    }
}
