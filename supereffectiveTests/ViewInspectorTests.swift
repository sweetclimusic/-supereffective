//
//  ViewInspectorTests.swift
//  supereffectiveTests
//
//  Created by Ashlee Muscroft on 06/05/2024.
//

import XCTest
import ViewInspector
import SwiftUI
@testable import supereffective

extension Inspection: InspectionEmissary { }

final class PokeApiTypeViewInspectorTests: XCTestCase {

    var observableState: PokeApi.PokeType.ObservableState!
    var interactorSpy: PokeApiTypeBusinessLogicSpy!
    var routerSpy: PokeApiTypeRouterLogicSpy!
    var timeout: Double = 60.0
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        observableState = PokeApi.PokeType.ObservableState()
        interactorSpy = .init()
        routerSpy = .init()
        observableState.interactor = interactorSpy
        observableState.router = routerSpy
    }
    
    func test_allPokemonTypeView_withExpected() throws {
        var sut = PokeApi.PokeType.AllPokemonTypeView(pokemonTypes: pokemonType)
        XCTAssertTrue(true)
    }
    
    func test_noContentView_withExpected() throws {
        var sut = PokeApi.PokeType.NoContentView()
        XCTAssertTrue(true)
    }
    
    func test_DamageRelationView_withExpected() throws {
        //Given
        let viewModel = PokeApi.PokeType.ViewContents.ViewModel(
            types: pokemonType,
            damageRelationViewModel: .init(type: "Steel",
                                           types: pokemonType.map{
                                               $0.name
                                           },
                                           superEffective: ["Fairy", "Rock", "Ice"],
                                           notVeryEffective: [])
        )
        let subtitle = "SUPER EFFECTIVE"
        let sut = PokeApi.PokeType.SceneView(observableState: observableState)
        sut.observableState.displayViewContents(viewModel: viewModel)

        var result = PokeApi.PokeType.DamageRelationView(
            viewModel: viewModel.damageRelationViewModel!,
            viewDelegate: observableState,
            pokemonTypes: pokemonType
        )
        // When
        let exp = sut.inspection.inspect { [self] view in
            guard let selectedTypeView = try? view.find(PokeApi.PokeType.DamageRelationView.self, containing: "Steel")
            else { return XCTFail("title not found") }
            
            //MARK: Find supereffective types
            guard let fairyTypeView = try? view.find(PokeApi.PokeType.PokemonTypeView.self, containing: "Fairy"),
            let rockTypeView = try? view.find(PokeApi.PokeType.PokemonTypeView.self, containing: "Rock"),
            let iceTypeView = try? view.find(PokeApi.PokeType.PokemonTypeView.self, containing: "Ice")
            else { return XCTFail("No SuperEffective types found") }
            
            let fairyResult = try fairyTypeView.find(text: subtitle).string()
            let rockResult = try rockTypeView.find(text: subtitle).string()
            let iceResult = try iceTypeView.find(text: subtitle).string()
            
            let button = try selectedTypeView.find(ViewType.Button.self, containing: "View Pokemon Types")
            try button.tap()
            // Then
            XCTAssertTrue(routerSpy.didNavigateToPokemonOfType)
            XCTAssertEqual(fairyResult, subtitle)
            XCTAssertEqual(rockResult, subtitle)
            XCTAssertEqual(iceResult, subtitle)
        }
        wait(for: [exp], timeout: timeout)
    }
    
    let pokemonType: [PokemonType] = [
        .init(name: "Bug"),
        .init(name: "Grass"),
        .init(name: "Fairy"),
        .init(name: "Flying"),
        .init(name: "Electric"),
        .init(name: "Rock"),
        .init(name: "Steel"),
        .init(name: "Ice")
    ]
}
