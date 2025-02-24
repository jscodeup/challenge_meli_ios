//
//  NumberFormatterHelper.swift
//  challenge_meli_ios
//
//  Created by Mac on 23/02/25.
//
import Foundation

class NumberFormatterHelper {
    static let shared = NumberFormatterHelper()

    private init() {}

    func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.locale = Locale(identifier: "es_CO")
        formatter.maximumFractionDigits = 0
        formatter.usesGroupingSeparator = true
        
        // 🔹 Asegurar que no haya espacios no deseados
        let formattedString = formatter.string(from: NSNumber(value: price)) ?? "$\(Int(price))"
        return formattedString.replacingOccurrences(of: "\u{00A0}", with: "")
    }
}
