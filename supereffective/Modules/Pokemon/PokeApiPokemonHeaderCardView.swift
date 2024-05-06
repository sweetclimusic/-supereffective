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

extension PokeApi.Pokemon {
    struct HeaderCardView: View {
        let viewModel: PokeApi.Pokemon.ViewContents.HeaderViewModel
        
        var didTapButton: VoidHandler?
        
        var body: some View {
            VStack(alignment: .leading) {
                // name
                Text(viewModel.title)
                // type
                Text(viewModel.subTitle)
                // SuperEffective against List
                Grid(alignment: .leading) {
                    GridRow(alignment: .center) {
                        ForEach(viewModel.effectiveAgainst, id: \.self) { type in
                            SwiftUI.Button(type) {
                                didTapButton?()
                            }
                        }
                    }
                }
            }
        }
    }
}
