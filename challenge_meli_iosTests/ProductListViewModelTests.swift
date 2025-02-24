//
//  ProductListViewModelTests.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import XCTest
@testable import challenge_meli_ios

// 🔹 Mock para simular una API con error
class MockProductServiceWithError: ProductRepository {
    func searchProducts(query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        completion(.failure(NSError(domain: "TestError", code: 500, userInfo: [NSLocalizedDescriptionKey: "Simulated API error"])))
    }

    func getProductDetail(productId: String, completion: @escaping (Result<ProductDetail, Error>) -> Void) {
        completion(.failure(NSError(domain: "TestError", code: 500, userInfo: [NSLocalizedDescriptionKey: "Simulated API error"])))
    }
}

class ProductListViewModelTests: XCTestCase {
    
    func testFetchProducts() {
        let viewModel = ProductListViewModel()
        let expectation = self.expectation(description: "Fetch Products")
        
        viewModel.onProductsUpdated = {
            XCTAssertFalse(viewModel.products.isEmpty, "La lista de productos no debería estar vacía")
            expectation.fulfill()
        }
        
        viewModel.fetchProducts(for: "iPhone")
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchProductsWithError() {
        let viewModel = ProductListViewModel(productService: MockProductServiceWithError()) 
        let expectation = self.expectation(description: "Handle API Error")

        viewModel.onError = { (errorMessage: String) in
            XCTAssertNotNil(errorMessage, "Debe devolver un mensaje de error")
            expectation.fulfill()
        }

        viewModel.fetchProducts(for: "INVALID_QUERY")
        wait(for: [expectation], timeout: 2.0)
    }

}
