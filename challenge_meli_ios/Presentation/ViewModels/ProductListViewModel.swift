//
//  ProductListViewModel.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//

import Foundation

class ProductListViewModel {
    
    // Closure para notificar cambios en los productos
    var onProductsUpdated: (() -> Void)?
    
    // Lista de productos obtenida del servicio
    private(set) var products: [Product] = [] {
        didSet {
            onProductsUpdated?()
        }
    }

    private let productService: ProductService

    init(productService: ProductService = ProductService()) {
        self.productService = productService
    }
    
    //Obtiene los productos desde la API y actualiza la lista
    func fetchProducts(for query: String = "") {
        let searchQuery = query.isEmpty ? "MCO" : query
        
        productService.searchProducts(query: searchQuery) { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
            case .failure(let error):
                print("Error al obtener productos: \(error.localizedDescription)")
            }
        }
    }
}
