//
//  ProductDetailViewModelTests.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import XCTest
@testable import challenge_meli_ios

class ProductDetailViewModelTests: XCTestCase {

    func testGetProductDetail() {
        let viewModel = ProductDetailViewModel()
        let expectation = self.expectation(description: "Fetch Product Detail")

        viewModel.onDetailLoaded = { product in  // 🔹 Cambiado a onDetailLoaded
            XCTAssertNotNil(product, "El detalle del producto no debería ser nulo")
            expectation.fulfill()
        }

        viewModel.fetchProductDetail(productId: "MCO1410570035") 
        wait(for: [expectation], timeout: 5.0)
    }
}
