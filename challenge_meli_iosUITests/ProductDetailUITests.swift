//
//  ProductDetailUITests.swift
//  challenge_meli_ios
//
//  Created by Mac on 24/02/25.
//
import XCTest

class ProductDetailUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testOpenProductDetail() throws {
        let firstCell = app.tables.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "Debería haber al menos un producto")

        firstCell.tap()

        let detailTitle = app.staticTexts["detailTitle"] 
        XCTAssertTrue(detailTitle.waitForExistence(timeout: 5), "Debería mostrar el título del producto en la pantalla de detalles")
    }
}

