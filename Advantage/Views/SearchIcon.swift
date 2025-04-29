//
//  SearchIcon.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct SearchIcon: View {
    
    let onClick: () -> Void
    
    var body: some View {
        Button(action: { onClick() },
               label: {
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.black.opacity(0.8))
                .frame(width: 20)
                .padding()
                .background(.customWhite)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .customDarkGray.opacity(0.2), radius: 6, x: 1, y: 2)
        })
        .buttonStyle(PlainButtonStyle())
        
    }
}

#Preview {
    SearchIcon(onClick: {})
}
