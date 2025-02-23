//
//  ProductDetailAPI.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//

import Foundation

class ProductDetailAPI {
    
    func fetchProductDetail(productId: String, completion: @escaping (Result<ProductDetail, Error>) -> Void) {
        let urlString = "https://api.mercadolibre.com/items/\(productId)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let productDetail = try JSONDecoder().decode(ProductDetail.self, from: data)
                completion(.success(productDetail))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
