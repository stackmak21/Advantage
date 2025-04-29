//
//  ViewExtensions.swift
//  Advantage
//
//  Created by Paris Makris on 30/4/25.
//

import Foundation
import SwiftUI


extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
}
