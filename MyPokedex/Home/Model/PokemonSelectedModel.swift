//
//  PokemonSelectedModel.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 13/08/23.
//

import Foundation

struct PokemonSelectedModel: Decodable {
    var sprites: PokemonSprites
}

struct PokemonSprites: Decodable {
    var image: String?
    
    enum CodingKeys2: String, CodingKey {
        case image = "front_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys2.self)
        self.image = try container.decode(String.self, forKey: .image)
    }
    
}
