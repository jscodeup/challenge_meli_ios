//
//  ProductDetailAPI.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import Foundation

class ProductDetailAPI {
    func fetchProductDetail(productId: String, completion: @escaping (Result<ProductDetail, Error>) -> Void) {
        let endpoint = "/items/\(productId)"
        
        NetworkManager.shared.fetchData(endpoint: endpoint) { (result: Result<ProductDetail, Error>) in
            switch result {
            case .success(let productDetail):
                completion(.success(productDetail))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
