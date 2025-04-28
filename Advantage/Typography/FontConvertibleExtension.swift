//
//  FontConvertibleExtension.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation
import SwiftUI

typealias SwiftUiFont = Font

extension FontConvertible {
    func font(size: CGFloat) -> SwiftUiFont {
        return SwiftUiFont.custom(name, size: size)
    }
}
