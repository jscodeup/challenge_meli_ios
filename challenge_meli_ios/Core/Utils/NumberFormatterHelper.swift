//
//  NumberFormatterHelper.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import Foundation

class NumberFormatterHelper {
    static let shared = NumberFormatterHelper()
    
    private let formatter: NumberFormatter
    
    private init() {
        formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "COP"
        formatter.locale = Locale(identifier: "es_CO")
        formatter.maximumFractionDigits = 0 
    }
    
    func formatPrice(_ price: Double) -> String {
        return formatter.string(from: NSNumber(value: price)) ?? "$\(Int(price))"
    }
}

