//
//  HomeScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel: HomeViewModel
    
    init(client: NetworkClient, moviesRepositoryMock: MoviesRepositoryMock? = nil) {
        self._viewModel = StateObject(wrappedValue: HomeViewModel(client: client, moviesRepositoryMock: moviesRepositoryMock))
    }
    
    var body: some View {
        VStack{
            Text(viewModel.popularMovies.first?.originalTitle ?? "")
                .onAppear{
                    viewModel.fetchPopularMovies()
                }
        }
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        HomeScreen(client: client, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
