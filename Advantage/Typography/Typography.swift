//
// Typography.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation
import UIKit
import SwiftUI


struct Typography {
    static func light(size: CGFloat) -> Font {
        FontFamily.Ubuntu.light.font(size: size)
    }
    static func regular(size: CGFloat) -> Font {
        FontFamily.Ubuntu.regular.font(size: size)
    }
    static func medium(size: CGFloat) -> Font {
        FontFamily.Ubuntu.medium.font(size: size)
    }
    static func bold(size: CGFloat) -> Font {
        FontFamily.Ubuntu.bold.font(size: size)
    }
}


