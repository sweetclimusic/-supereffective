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

protocol PokeApiTypePresentationLogic {
    func presentViewContents(response: PokeApi.PokeType.ViewContents.Response)
}

extension PokeApi.PokeType {
    class Presenter {
        weak var sceneView: PokeApiTypeDisplayLogic!

        let builder = PokeApi.PokeType.ViewModelBuilder()
    }
}

extension PokeApi.PokeType.Presenter: PokeApiTypePresentationLogic {
    func presentViewContents(response: PokeApi.PokeType.ViewContents.Response) {
        sceneView.displayViewContents(
            viewModel: .init(
                types: response.types,
                damageRelationViewModel: builder.buildDamageRelationViewModel(response: response)
            )
        )
    }
}
