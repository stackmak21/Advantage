//
//  BackButtonView.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import SwiftUI

struct BackButtonView: View {
    
    let onBackClicked: () -> Void
    
    var body: some View {
        Button(
            action: {
                onBackClicked()
            },
            label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14)
                    .foregroundColor(Color.customWhite)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.customGray.opacity(0.4))
                    )
            }
        )
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    BackButtonView(onBackClicked: {})
}
