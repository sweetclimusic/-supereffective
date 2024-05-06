//
//  Container.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 30/04/2024.
//

import Factory
import Foundation

extension Container {
    var pokeApiGetService: Factory<PokeApiGetService> {
        self { PokeTypesService() }
    }
    
}

@Observable class FactoryViewModel {
    @ObservationIgnored
    @Injected(\.pokeApiGetService) private var pokeApiGetService
}
