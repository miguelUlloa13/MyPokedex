//
//  ApiClient.swift
//  MyPokedex
//
//  Created by Miguel Angel Bric Ulloa on 13/08/23.
//

import Foundation

/// Class to get URL Image
final class PokemonSelectedApi  {
    
    /// Gets the data
    /// - Returns: The data or an Error
    func getSprite(url: String) async -> Result<PokemonSprites, NetworkError> {
        
        // Validate Url
        guard let apiUrl = URL(string: url) else {
            return .failure(.invalidURL)
        }
        
        do{
            // Send request
            let (data, response) = try await URLSession.shared.data(from: apiUrl)

            // Validate http Response
            guard let httpResponse = response as? HTTPURLResponse else{
                return .failure(.httpResponseError)
            }
            
            // Valide Http Code
            if (httpResponse.statusCode > 299){
                return .failure(.statusCodeError)
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(PokemonSelectedModel.self, from: data)
                return .success(decodeData.sprites)
            } catch {
                return .failure(.couldNotDecodeData)
            }
            
        } catch {
            return .failure(.generic)
        }
    }
    
}


/// Class to make the connection to the API.
final class APIClient {
    
    /// Gets the data
    /// - Returns: The data or an Error
    func getPokemons() async -> Result<PokemonResponseDataModel, NetworkError> {
        
        // Validate Url
        guard let apiUrl = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=60&offset=151") else {
            return .failure(.invalidURL)
        }
        
        do{
            // Send request
            let (data, response) = try await URLSession.shared.data(from: apiUrl)

            // Validate http Response
            guard let httpResponse = response as? HTTPURLResponse else{
                return .failure(.httpResponseError)
            }
            
            // Valide Http Code
            if (httpResponse.statusCode > 299){
                return .failure(.statusCodeError)
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(PokemonResponseDataModel.self, from: data)
                return .success(decodeData)
            } catch {
                return .failure(.couldNotDecodeData)
            }
            
        } catch {
            return .failure(.generic)
        }
    }

}
