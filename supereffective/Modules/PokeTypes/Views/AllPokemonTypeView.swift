//
//  AllPokemonTypeViews.swift
//  supereffective
//
//  Created by Ashlee Muscroft on 02/05/2024.
//

import SwiftUI
extension PokeApi.PokeType {
    struct AllPokemonTypeView: View {
        @Environment(\.isSearching) var isSearching
        @Environment(\.dismissSearch) var dismissSearch
        
        @State var path = NavigationPath()
        @State private var searchString: String = ""
        @State var selectedTypeName: String = ""
        
        @State var pokemonTypes: [PokemonType]
        weak var viewDelegate: PokeApiTypeViewDelegate?
        var body: some View {
            VStack(alignment: .leading) {
                Spacer()
                List(pokemonTypes, id: \.self) { pokemonType in
                    Button(
                        action: { 
                            path.append(pokemonType)
                            viewDelegate?.displaySelectedType(for: pokemonType.url)
                        },
                        label: {
                            HStack {
                                Image(systemName: "bolt.horizontal.circle.fill")
                                    .modifier(PokeBall())
                                Text(pokemonType.name)
                                    .padding(.trailing)
                                    .foregroundColor(.primary)
                                Spacer(minLength: .zero)
                                Image(systemName: "chevron.right")
                                    .symbolRenderingMode(.palette)
                                    .foregroundColor(.secondary)
                                    .frame(alignment: .trailing)
                            }
                        })
                }
                .listRowInsets(EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                .frame(minHeight: 1000)
                .listStyle(.inset)
                .navigationTitle("Pokemon Types")
                
                .searchable(
                    text: $searchString,
                    prompt: Text("Search for SuperEffective Types")
                )
            }
        }
    }
}

#Preview {
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
    let jsonData = pokemonTypeJSON.data(using: .utf8) ?? Data()
    guard let pokemonTypes =  try? JSONDecoder().decode(PokemonTypes.self, from: jsonData)
    else { return EmptyView() }
    return PokeApi.PokeType.AllPokemonTypeView(pokemonTypes:pokemonTypes.results)
}
#Preview {
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
    let jsonData = pokemonTypeJSON.data(using: .utf8) ?? Data()
    guard let pokemonTypes =  try? JSONDecoder().decode(PokemonTypes.self, from: jsonData)
    else { return EmptyView() }
    return PokeApi.PokeType.AllPokemonTypeView(pokemonTypes:pokemonTypes.results).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
