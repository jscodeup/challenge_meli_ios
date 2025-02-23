//
//  ProductAPI.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//

import Foundation

class ProductAPI {
    private let baseURL = "https://api.mercadolibre.com/sites/MCO/search?q="
    
    func fetchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        let urlString = "\(baseURL)\(query)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MercadoLibreResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

// Estructura para decodificar la respuesta de la API
struct MercadoLibreResponse: Decodable {
    let results: [Product]
}
