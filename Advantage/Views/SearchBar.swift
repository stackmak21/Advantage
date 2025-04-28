//
//  SearchBar.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct SearchBar: View {
    
    @State var isFocused: Bool = false
    var body: some View {
        HStack{
            if !isFocused{
                Spacer()
            }
            Button(
                action: {
                    isFocused.toggle()
                },
                label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black.opacity(0.8))
                        .frame(width: 20)
                        .frame(maxWidth: isFocused ? .infinity : nil, alignment: .leading)
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 1, y: 2)
                }
            )
            .buttonStyle(PlainButtonStyle())
        }
        .animation(.easeInOut, value: isFocused)
    }
}

#Preview {
    SearchBar()
        .padding()
}
