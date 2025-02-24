//
//  NumberFormatterHelperTests.swift
//  challenge_meli_ios
//
//  Created by Mac on 24/02/25.
//

import XCTest
@testable import challenge_meli_ios

class NumberFormatterHelperTests: XCTestCase {

    func testFormatPrice() {
        let formattedPrice = NumberFormatterHelper.shared.formatPrice(1500000)
        XCTAssertEqual(formattedPrice, "$1.500.000", "El precio debería estar formateado correctamente")
    }
}

