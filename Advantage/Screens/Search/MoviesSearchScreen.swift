//
//  MoviesSearchScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI
import SwiftfulRouting

struct MoviesSearchScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: MoviesSearchViewModel
    
    init(client: NetworkClient, router: AnyRouter, moviesRepositoryMock: MoviesRepositoryMock? = nil) {
        self._viewModel = StateObject(wrappedValue: MoviesSearchViewModel(client: client, router: router, moviesRepositoryMock: moviesRepositoryMock))
    }
    
    var body: some View {
        ZStack{
            Color.customWhite.ignoresSafeArea()
            VStack(spacing: 0){
                SearchBarView(
                    searchText: $viewModel.searchText,
                    onDebounceSearch: {
                        viewModel.fetchRequestedMovies()
                    },
                    onClearClicked: { viewModel.fetchPopularMovies() }
                )
                .padding(.top)
                .padding(.bottom, 6)
                
                if viewModel.searchedMovies.isEmpty{
                    EmptyContent()
                        .padding(.top, 100)
                    Spacer()
                }
                else{
                    ScrollViewReader{ scrollProxy in
                        ScrollView(.vertical) {
                            VStack(spacing: 20){
                                ForEach(viewModel.searchedMovies, id: \.id) { movie in
                                    if movie.mediaType == .movie && movie.isValid {
                                        MoviePreviewCellCiew(
                                            movie: movie,
                                            onClick: {
                                                viewModel.navigateToMovieDetailsScreen(movieId: movie.id)
                                            }
                                        )
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                
            }
            .toolbar{
                ToolbarTitle(title: Strings.allMovies)
                ToolbarBackButton(action: { dismiss() })
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let client: NetworkClient = NetworkClient()
    RouterView{ router in
        MoviesSearchScreen(client: client,router: router, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
