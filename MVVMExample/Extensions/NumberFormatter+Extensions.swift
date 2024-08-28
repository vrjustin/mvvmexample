//
//  NumberFormatter+Extensions.swift
//  MVVMExample
//
//  Created by Justin Maronde on 8/28/24.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
    
}
