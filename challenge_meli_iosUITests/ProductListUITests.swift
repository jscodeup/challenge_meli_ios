//
//  ProductListUITests.swift
//  challenge_meli_ios
//
//  Created by Mac on 24/02/25.
//
import XCTest

class ProductListUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch() //
    }

    func testSearchProduct() throws {
        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.exists, "El campo de búsqueda debería existir")

        searchField.tap()
        searchField.typeText("iPhone\n")

        let firstCell = app.tables.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "Debería aparecer al menos un producto")
    }
}

