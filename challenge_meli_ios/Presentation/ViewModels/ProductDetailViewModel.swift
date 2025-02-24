//
//  ProductDetailViewModel.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import Foundation

class ProductDetailViewModel {
    private let productDetailService = ProductDetailAPI()
    var productDetail: ProductDetail?
    var onDetailLoaded: ((ProductDetail) -> Void)?
    var onError: ((String) -> Void)?

    func fetchProductDetail(productId: String) {
        productDetailService.fetchProductDetail(productId: productId) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let product):
                    self?.productDetail = product
                    self?.onDetailLoaded?(product) 
                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
}
