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
        ZStack{
            Color.customWhite.ignoresSafeArea()
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
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
                            NavigationLink(
                                destination: {
                                    MoviesSearchScreen(client: NetworkClient())
                                },
                                label: {
                                    SearchIcon()
                                        
                                }
                            )
                            .unredacted()
                            
                        }
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
                                    NavigationLink(
                                        destination: {
                                            MovieDetailsScreen(client: NetworkClient(), movieId: movie.id)
                                        },
                                        label: {
                                            PopularMovieThumbnailView(movie: movie)
                                                .shadow(color: .customBlack.opacity(0.3), radius: 6, x: 1, y: 2)
                                                .frame(width: 160, height: 260)
                                        }
                                    )
                                    
                                    
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
                                MoviePreviewCellCiew(movie: movie, onClick: {  })
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
            }
            .onAppear{
                viewModel.fetchHomeMovies()
            }
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        HomeScreen(client: client, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
