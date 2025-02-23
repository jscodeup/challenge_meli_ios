//
//  ProductRepository.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//

protocol ProductRepository {
    func searchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void)
    func getProductDetail(productId: String, completion: @escaping (Result<Product, Error>) -> Void)
}
