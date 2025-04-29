//
//  MoviesSearchScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI
import SwiftfulRouting

struct MoviesSearchScreen: View {
    
    @StateObject var viewModel: MoviesSearchViewModel
    
    init(client: NetworkClient, router: AnyRouter, moviesRepositoryMock: MoviesRepositoryMock? = nil) {
        self._viewModel = StateObject(wrappedValue: MoviesSearchViewModel(client: client, router: router, moviesRepositoryMock: moviesRepositoryMock))
    }
    
    var body: some View {
        VStack{
            SearchBarView(searchText: $viewModel.searchText, onDebounceSearch: {
                viewModel.fetchRequestedMovies()
            })
            Spacer()
            ScrollView(.vertical) {
                VStack(spacing: 20){
                    ForEach(viewModel.searchedMovies, id: \.id) { movie in
                        HStack{
                            ImageLoader(url: "https://image.tmdb.org/t/p/w500" + movie.posterPath)
                                .frame(width: 80, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            VStack{
                                Text(movie.releaseDate.formatDate(to: "YYYY"))
                                    .font(Typography.regular(size: 12))
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(movie.title)
                                    .font(Typography.bold(size: 14))
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(movie.overview)
                                    .font(Typography.light(size: 12))
                                    .lineLimit(2)
                                    .foregroundColor(Color.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                HStack{
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 16)
                                        .foregroundColor(Color.yellow)
                                    let rating = String(format: "%.1f", movie.voteAverage.round(to: 1))
                                    Text(rating)
                                        .font(Typography.medium(size: 12))
                                        .foregroundColor(Color.black)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            Spacer()
                            
                            Button(
                                action: {},
                                label: {
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 16)
                                        .foregroundColor(Color.black)
                                }
                            )
                            .buttonStyle(PlainButtonStyle())
                            .padding(.leading)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

#Preview {
    let client: NetworkClient = NetworkClient()
    RouterView{ router in
        MoviesSearchScreen(client: client,router: router, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
