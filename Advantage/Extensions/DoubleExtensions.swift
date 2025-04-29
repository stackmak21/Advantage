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
    
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .second, .nanosecond]
        formatter.unitsStyle = style
        return formatter.string(from: self) ?? ""
    }

}

extension Int{
    func asHourMinutesString() -> String{
        let hours = self / 60
        let remainingMinutes = self % 60
        return "\(hours)h\(remainingMinutes)m"
    }
}
