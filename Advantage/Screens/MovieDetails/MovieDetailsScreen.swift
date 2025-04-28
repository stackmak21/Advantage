//
//  MovieDetailsScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    init(client: NetworkClient) {
        self._viewModel = StateObject(wrappedValue: MovieDetailsViewModel(client: client))
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        MovieDetailsScreen(client: client)
    }
    
}
