//
//  SearchBarView.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import SwiftUI

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @FocusState var isFocused: Bool
    let onDebounceSearch: () -> Void
    
    @State var task: Task<Void, Never>? = nil
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.black : Color.black.opacity(0.8)
                )
            
            TextField(Strings.searchMovies, text: $searchText)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.black)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
                .focused($isFocused)
                .accentColor(Color.black)
                
        }
        .font(Typography.regular(size: 16))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.customWhite)
                .shadow(color: .customBlack.opacity(isFocused ? 0.30 : 0.15), radius: 4, x: 0, y: 2)
            
        )
        .padding()
        .onChange(of: searchText) { text in
            task?.cancel()

            guard !text.isEmpty else { return }

            task = Task {
                try? await Task.sleep(seconds: 0.4)
                if !Task.isCancelled {
                    onDebounceSearch()
                }
            }
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), onDebounceSearch: {
        print("Debounced")
    })
        
}
