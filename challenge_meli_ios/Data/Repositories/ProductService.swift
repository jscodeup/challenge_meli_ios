//
//  ProductService.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
class ProductService: ProductRepository {
    private let api = ProductAPI()
    private let detailAPI = ProductDetailAPI() 

    func searchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        api.fetchProducts(query: query, completion: completion)
    }

    func getProductDetail(productId: String, completion: @escaping (Result<ProductDetail, Error>) -> Void) {
        detailAPI.fetchProductDetail(productId: productId, completion: completion)
    }
}

