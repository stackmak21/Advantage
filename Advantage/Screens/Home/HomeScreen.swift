//
//  HomeScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel: HomeViewModel
    
    @State var isSearchFocused: Bool = false
    @Namespace var searchBarNamepace
    @State var searchText: String = ""
    
    init(client: NetworkClient, moviesRepositoryMock: MoviesRepositoryMock? = nil) {
        self._viewModel = StateObject(wrappedValue: HomeViewModel(client: client, moviesRepositoryMock: moviesRepositoryMock))
    }
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                        if !isSearchFocused{
                            VStack{
                                Group{
                                    Text("Hello 🖐️")
                                        .font(Typography.regular(size: 16))
                                        .foregroundColor(Color.black)
                                    Text("Advantage Fintech")
                                        .font(Typography.bold(size: 18))
                                        .foregroundColor(Color.black)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        SearchBar(
                            onSearchClicked: {
                                
                        })
                    }
                    .padding()
                    
                    if !isSearchFocused{
                        Text("Popular")
                            .font(Typography.medium(size: 18))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20){
                                ForEach(viewModel.popularMovies, id: \.id) { movie in
                                    PopularMovieThumbnailView(movie: movie)
                                        .shadow(color: .black.opacity(0.3), radius: 6, x: 1, y: 2)
                                        .frame(width: 160, height: 260)
                                    
                                }
                                .padding(.vertical, 10)
                            }
                            .padding(.horizontal)
                        }
                        .frame(height: 280)
                        
                        Text("Top Rated")
                            .font(Typography.medium(size: 18))
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        
                        VStack(spacing: 20){
                            ForEach(viewModel.topRatedMovies, id: \.id) { movie in
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
        .onAppear{
            viewModel.fetchHomeMovies()
        }
        .animation(.easeInOut, value: isSearchFocused)
        
        
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        HomeScreen(client: client, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
