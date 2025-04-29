//
//  EmptyContent.swift
//  Advantage
//
//  Created by Paris Makris on 30/4/25.
//

import SwiftUI

struct EmptyContent: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(asset: Asset.Illustrations.noListings)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.customDarkGray)
                .frame(width: 80)

            Text(Strings.noMovies)
                .font(Typography.bold(size: 18))
                .foregroundColor(Color.customDarkGray)

            Text(Strings.emptyContentMessage)
                .font(Typography.regular(size: 14))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }
}

#Preview {
    EmptyContent()
}
