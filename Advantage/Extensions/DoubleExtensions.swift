//
//  DoubleExtensions.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
