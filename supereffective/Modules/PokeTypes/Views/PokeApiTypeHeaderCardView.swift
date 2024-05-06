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

/*
 This is an example placeholder for a subview. It should be in a 'Views' group in Xcode
 but I could not make the templates create it properly. You should delete this card and
 create the appropriate UI for the scene you are developing
 */

extension PokeApi.PokeType {
    struct PokemonTypeView: View {
        var title: String = "some"
        var subtitle: String = "this"
        var highlight: Bool = false
        
        var body: some View {
            ZStack(alignment: .leading) {
                //box shadow
                Rectangle()
                    .fill(.background)
                    .frame(width: .infinity, height: 56, alignment: .leading)
                    .shadow(color: .secondary, radius: 1, x: 0, y: 1)
                VStack(alignment: .leading, spacing: 0) {
                    Text(title).font(.headline)
                    Text(subtitle.uppercased())
                        .modifier(
                            SuperEffective(isSuperEffective: true)
                        )
                }
                .frame(alignment: .leading)
                .opacity(1)
            }
            
        }
    }
    
    struct DamageRelationView: View {
        let viewModel: PokeApi.PokeType.ViewContents.DamageRelationViewModel

        var didTapButton: VoidHandler?
        @State var pokemonTypes: [PokemonType]
        @State var selectedPokemonType : PokemonType
        
        @ViewBuilder
        func buildDamageRelationList() -> some View {
            var highlight = false
            if viewModel.superEffective.contains(selectedPokemonType.name){
                highlight = true
            }
            return EmptyView()
        }
        
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(viewModel.type)
                List(pokemonTypes, id: \.self) {_ in 
                    PokemonTypeView(title: "", subtitle: "", highlight: false )
                }
                    .listStyle(.plain)
                Button(viewModel.buttonText) {
                    didTapButton?()
                }
            }
            .padding()
            .background(Color(viewModel.theme))
            .navigationTitle(viewModel.type)
        }
    }
}
#Preview{
    PokeApi.PokeType.PokemonTypeView().preferredColorScheme(.dark)
}
#Preview{
    PokeApi.PokeType.PokemonTypeView()
}
