//
//  ProductDetail.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import Foundation

struct ProductDetail: Decodable {
    let id: String
    let title: String
    let price: Double
    let pictures: [Picture]
    let warranty: String?
    let permalink: String
    let condition: String
    let brand: String?
    let location: String?
    let acceptsMercadoPago: Bool
    let freeShipping: Bool
    
    struct Picture: Decodable {
        let url: String
    }

    enum CodingKeys: String, CodingKey {
        case id, title, price, pictures, warranty, permalink, condition, attributes, sellerAddress = "seller_address", shipping
        case acceptsMercadoPago = "accepts_mercadopago"
    }

    enum ShippingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }

    enum AttributeKeys: String, CodingKey {
        case brand = "BRAND"
    }

    enum SellerKeys: String, CodingKey {
        case city, state, country
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
        pictures = try container.decode([Picture].self, forKey: .pictures)
        warranty = try? container.decode(String.self, forKey: .warranty)
        permalink = try container.decode(String.self, forKey: .permalink)
        condition = try container.decode(String.self, forKey: .condition)
        acceptsMercadoPago = try container.decode(Bool.self, forKey: .acceptsMercadoPago)

        // Extraer el estado del envío gratuito
        let shippingContainer = try container.nestedContainer(keyedBy: ShippingKeys.self, forKey: .shipping)
        freeShipping = try shippingContainer.decode(Bool.self, forKey: .freeShipping)

        // Extraer la marca desde los atributos
        var attributes = try container.nestedUnkeyedContainer(forKey: .attributes)
        var brandName: String? = nil
        while !attributes.isAtEnd {
            let attribute = try attributes.nestedContainer(keyedBy: AttributeKeys.self)
            if let brand = try? attribute.decode(String.self, forKey: .brand) {
                brandName = brand
                break
            }
        }
        brand = brandName

        // Extraer la ubicación del vendedor
        if let sellerContainer = try? container.nestedContainer(keyedBy: SellerKeys.self, forKey: .sellerAddress) {
            let city = try? sellerContainer.decode(String.self, forKey: .city)
            let state = try? sellerContainer.decode(String.self, forKey: .state)
            let country = try? sellerContainer.decode(String.self, forKey: .country)
            location = [city, state, country].compactMap { $0 }.joined(separator: ", ")
        } else {
            location = nil
        }
    }
}
