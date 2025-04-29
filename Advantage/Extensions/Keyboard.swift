//
//  Keyboard.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
