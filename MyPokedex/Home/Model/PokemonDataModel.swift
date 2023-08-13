//
//  PokemonDataModel.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 13/08/23.
//

import Foundation

struct PokemonDataModel: Decodable {
    let name: String?
    let url: String?
}

struct PokemonResponseDataModel: Decodable {
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .pokemons)
    }
}
