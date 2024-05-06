/*
 * Copyright 2024 Ashlee Muscroft
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI
import Factory

extension PokeApi.PokeType {
    public enum SceneState: Identifiable, Equatable, View {
        case empty
        case all(
            pokemonTypes: [PokemonType]?,
            viewDelegate: PokeApiTypeViewDelegate?
        )
        case selectedType(
            viewModel: PokeApi.PokeType.ViewContents.ViewModel,
            viewDelegate: PokeApiTypeViewDelegate?
        )
        
        static func == (lhs: PokeApi.PokeType.SceneState, rhs: PokeApi.PokeType.SceneState) -> Bool {
            switch (lhs, rhs) {
            case
                (.empty, .empty),
                (.all(_, _), .all(_, _)),
                (.selectedType(_, _), .selectedType(_, _)):
                return true
            case _:
                return false
            }
        }
        
        public var id: String {
            switch self {
            case .empty:
                return "empty"
            case .all:
                return  "all"
            case .selectedType:
                return "selectedType"
            }
        }
        
        // handle the control flow with a view builder
        @ViewBuilder
        func allPokemonTypeView(pokemonTypes: [PokemonType]?, viewDelegate: PokeApiTypeViewDelegate? ) -> some View {
            if pokemonTypes == nil || pokemonTypes?.isEmpty == true {
                NoContentView()
            } else {
                AllPokemonTypeView(pokemonTypes: pokemonTypes!,viewDelegate: viewDelegate)
            }
        }
        
        public var body: some View {
            switch self {
            case .empty:
                NoContentView()
            case .all(pokemonTypes: let pokemonTypes, 
                      viewDelegate: let viewDelegate):
                allPokemonTypeView(pokemonTypes: pokemonTypes, viewDelegate: viewDelegate)
            case .selectedType(viewModel: let viewModel,
                               viewDelegate: let viewDelegate):

                    PokeApi.PokeType.DamageRelationView(
                        viewModel: viewModel.damageRelationViewModel!,
                        viewDelegate: viewDelegate,
                        pokemonTypes: viewModel.types
                    )
            }
        }
    }
    
    struct SceneView: View {
        var observableState: ObservableState = ObservableState()

        weak var viewDelegate: PokeApiTypeViewDelegate?
        
        internal let inspection = Inspection<Self>()
        var body: some View {
            ScrollView{
                AnyView(observableState.viewState.body)
            }
            .onReceive(
                inspection.notice
            ) {
                self.inspection.visit(
                    self,
                    $0
                )
            }
            .onAppear{
                observableState.interactor.getViewContents()
            }.navigationTitle(
                Text(PokeApi.PokeType.ViewContents.ViewModel.title)
            )
        }
    }
}
