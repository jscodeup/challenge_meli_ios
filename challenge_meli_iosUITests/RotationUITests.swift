//
//  RotationUITests.swift
//  challenge_meli_ios
//
//  Created by Mac on 24/02/25.
//
import XCTest

class RotationUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testRotationKeepsStateInProductList() throws {
        let firstCell = app.tables.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "La lista de productos debe cargarse")

        // Rotar a landscape y luego volver a portrait
        XCUIDevice.shared.orientation = .landscapeLeft
        sleep(2) 
        XCUIDevice.shared.orientation = .portrait

        // Verificar que aún hay productos en la tabla después de la rotación
        XCTAssertTrue(firstCell.exists, "La lista de productos debe mantenerse tras la rotación")
    }
}
