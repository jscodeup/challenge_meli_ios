//
//  ProductAPI.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import Foundation

class ProductAPI {
    func fetchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        let endpoint = "/sites/MCO/search?q=\(query)"
        
        NetworkManager.shared.fetchData(endpoint: endpoint) { (result: Result<MercadoLibreResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

// Estructura para decodificar la respuesta de la API
struct MercadoLibreResponse: Decodable {
    let results: [Product]
}
