//
//  ProductService.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//

class ProductService: ProductRepository {
    private let api = ProductAPI()
    
    func searchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        api.fetchProducts(query: query, completion: completion)
    }

    func getProductDetail(productId: String, completion: @escaping (Result<Product, Error>) -> Void) {
        // Implementación futura si se necesita obtener el detalle de un producto
    }
}
