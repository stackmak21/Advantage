//
//  SearchBar.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct SearchBar: View {
    
    let onSearchClicked: () -> Void
    
    var body: some View {
        HStack{
            Button(
                action: {
                    onSearchClicked()
                },
                label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black.opacity(0.8))
                        .frame(width: 20)
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 1, y: 2)
                }
            )
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    SearchBar(onSearchClicked: {})
        .padding()
}
