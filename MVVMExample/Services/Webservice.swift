//
//  Webservice.swift
//  MVVMExample
//
//  Created by Justin Maronde on 8/27/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case badDecoding
}

class Webservice {
    
    func getProducts() async throws -> [Product] {
        
        guard let url = URL(string: "https://fakestoreapi.com/products") else { throw NetworkError.badURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.badDecoding
        }
        
        return products
    }
}
