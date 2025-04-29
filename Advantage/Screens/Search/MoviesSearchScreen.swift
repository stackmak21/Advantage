//
//  MoviesSearchScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

struct MoviesSearchScreen: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    init(client: NetworkClient) {
        self._viewModel = StateObject(wrappedValue: MovieDetailsViewModel(client: client))
    }
    
    var body: some View {
        VStack{
            SearchBarView(searchText: $viewModel.searchText, onDebounceSearch: { print(viewModel.searchText) })
            Spacer()
            
        }
    }
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        MoviesSearchScreen(client: client)
    }
}
