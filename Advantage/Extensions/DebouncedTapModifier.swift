//
//  DebouncedTapModifier.swift
//  Advantage
//
//  Created by Paris Makris on 30/4/25.
//

import Foundation
import SwiftUI

struct DebouncedTapModifier: ViewModifier {
    
    @State private var isTapped = false
    let delay: TimeInterval

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                guard !isTapped else { return }
                isTapped = true
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    isTapped = false
                }
            }
    }
}

extension View{
    func debounce(_ delay: TimeInterval = 0.2) -> some View{
        self.modifier(DebouncedTapModifier(delay: delay))
    }
}
