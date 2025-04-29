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
    let onClearClicked: () -> Void
    
    @State var task: Task<Void, Never>? = nil
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.customBlack : Color.customBlack.opacity(0.8)
                )
            
            TextField("", text: $searchText)
                .placeholder(when: searchText.isEmpty, placeholder: {
                    Text(Strings.searchMovies)
                        .font(Typography.regular(size: 16))
                        .foregroundColor(Color.customLightGray)
                })
                .foregroundColor(Color.customBlack)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.customDarkGray)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            onClearClicked()
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
                .focused($isFocused)
                .accentColor(Color.customDarkGray)
                
        }
        .font(Typography.regular(size: 16))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.customWhite)
                .shadow(color: .customBlack.opacity(isFocused ? 0.30 : 0.15), radius: 4, x: 0, y: 2)
            
        )
        .padding(.horizontal, 10)
        .onChange(of: searchText) { text in
            task?.cancel()

            guard !text.isEmpty else { return }

            task = Task {
                try? await Task.sleep(seconds: 0.3)
                if !Task.isCancelled {
                    onDebounceSearch()
                }
            }
        }
        .onChange(of: searchText) { text in
            if text.isEmpty {
                onClearClicked()
            }
        }
        .onAppear{
            isFocused = true
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), onDebounceSearch: {
        print("Debounced")
    }, onClearClicked: {})
        
}
