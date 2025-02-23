//
//  Product.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let condition: String
    let thumbnail: String
    let permalink: String
    let price: Double
    let currencyId: String
    let availableQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, condition, permalink, price
        case thumbnail = "thumbnail"
        case currencyId = "currency_id"
        case availableQuantity = "available_quantity"
    }
}
