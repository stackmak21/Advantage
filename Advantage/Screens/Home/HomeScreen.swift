//
//  HomeScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI
import SwiftfulRouting

struct HomeScreen: View {
    
    @StateObject var viewModel: HomeViewModel
    
    init(client: NetworkClient, router: AnyRouter, moviesRepositoryMock: MoviesRepositoryMock? = nil) {
        self._viewModel = StateObject(wrappedValue: HomeViewModel(client: client, moviesRepositoryMock: moviesRepositoryMock, router: router))
    }
    
    var body: some View {
        ZStack{
            Color.customWhite.ignoresSafeArea()
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        homeHeader()
                            .padding()
                        Text(Strings.popular)
                            .font(Typography.medium(size: 18))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .unredacted()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20){
                                ForEach(viewModel.popularMovies, id: \.id) { movie in
                                    PopularMovieThumbnailView(
                                        movie: movie,
                                        onClick: { viewModel.navigateToMovieDetailsScreen(movieId: movie.id) }
                                    )
                                        .frame(width: 160, height: 280)
                                }
                                .padding(.bottom, 20)
                                .padding(.top, 10)
                            }
                            .padding(.horizontal)
                        }
                        
                        Text(Strings.topRated)
                            .font(Typography.medium(size: 18))
                            .foregroundColor(Color.customBlack)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .unredacted()
                        
                        VStack(spacing: 20){
                            ForEach(viewModel.topRatedMovies, id: \.id) { movie in
                                MoviePreviewCellCiew(movie: movie, onClick: { viewModel.navigateToMovieDetailsScreen(movieId: movie.id) })
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .refreshable {
                    viewModel.fetchHomeMovies()
                }
                
            }
            .onAppear{
                if viewModel.isReloadAllowed(){
                    viewModel.fetchHomeMovies()
                }
            }
        }
        .redacted(reason: viewModel.isLoading && viewModel.isReloadAllowed() ? .placeholder : [])
    }
    
    private func homeHeader() -> some View {
        HStack{
            VStack{
                Group{
                    Text(Strings.hello)
                        .font(Typography.regular(size: 16))
                        .foregroundColor(Color.customBlack)
                    Text(Strings.advanceFintech)
                        .font(Typography.bold(size: 18))
                        .foregroundColor(Color.customBlack)
                }
                .unredacted()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            SearchIcon(onClick: {
                viewModel.navigateToSearchScreen()
            })
            .unredacted()
        }
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    RouterView{ router in
        HomeScreen(client: client,router: router, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
