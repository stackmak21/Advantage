//
//  GenreTagView.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import SwiftUI

struct GenreTagView: View {
    let genre: String
    
    var body: some View {
        Text(genre)
            .font(Typography.regular(size: 14))
            .foregroundColor(Color.customWhite)
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.customLightGray.opacity(0.2))
            )
    }
}

#Preview {
    GenreTagView(genre: "Fantasy")
}
