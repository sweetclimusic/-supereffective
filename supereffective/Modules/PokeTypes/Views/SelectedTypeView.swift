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
        var title: String
        var effective: Bool = false
        var notEffective: Bool = false
        var themeColor: Color = .secondary
        @ViewBuilder
        func buildSubtitle() -> some View {
            let superEffectiveTitle = "Super Effective"
            let notEffectiveTitle = "Not Very Effective"
            
            if effective {
                Text(superEffectiveTitle.uppercased())
                    .modifier(
                        SuperEffective(isSuperEffective: effective)
                    )
            }
            else if notEffective {
                Text(notEffectiveTitle.uppercased())
                    .modifier(
                        SuperEffective(isNotEffective: notEffective)
                    )
            } else {
                EmptyView()
            }
        }
        
        var body: some View {
            ZStack(alignment: .leading) {
                //box shadow
                Rectangle()
                    .fill(.background)
                    .frame(width: .infinity, height: 56, alignment: .leading)
                    .shadow(color: themeColor, radius: 1, x: 0, y: 1)
                HStack{
                    Image(systemName: "bolt.horizontal.circle.fill")
                        .modifier(PokeBall())
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title.uppercased())
                            .font(.body)
                        buildSubtitle()
                    }
                    .frame(alignment: .leading)
                    .opacity(1)
                }
            }
            
        }
    }
    
    struct DamageRelationView: View {
        let viewModel: PokeApi.PokeType.ViewContents.DamageRelationViewModel

        weak var viewDelegate: PokeApiTypeViewDelegate?
        @State var pokemonTypes: [PokemonType]
        
        internal let inspection = Inspection<Self>()
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack{
                    Text(viewModel.type.uppercased())
                        .font(.largeTitle)
                }
                .padding(0)
                .background(
                    LinearGradient(colors: [Color(.systemBackground), viewModel.theme], startPoint: .init(x: 0.85, y: 0), endPoint: .init(x: 0.95, y: 1))
                )
                
                List(pokemonTypes, id: \.self) { type in
                        PokemonTypeView(
                            title: type.name,
                            effective: viewModel.superEffective.contains(type.name),
                            notEffective: viewModel.notVeryEffective.contains(type.name),
                            themeColor: viewModel.theme)
                    .listRowSeparator(.hidden)
                }
                .listRowInsets(EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                .frame(minHeight: 1000)
                .listStyle(.inset)
                Button(viewModel.buttonText) {
                    viewDelegate?.navigateToPokemonView()
                }
            }
            .navigationTitle(viewModel.type)
            .toolbar(.hidden)
            .onReceive(inspection.notice) { self.inspection.visit(self, $0) }
        }
    }
}
#Preview{
    PokeApi.PokeType.PokemonTypeView(title: "Normal", effective: true)
        .preferredColorScheme(.dark)
}
#Preview{
    PokeApi.PokeType.PokemonTypeView(title: "Normal", notEffective: true)
}
