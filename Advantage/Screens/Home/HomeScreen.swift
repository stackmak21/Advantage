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
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                        VStack{
                            Group{
                                Text("Hello 🖐️")
                                    .font(Typography.regular(size: 16))
                                    .foregroundColor(Color.black)
                                Text("Paris Makris")
                                    .font(Typography.bold(size: 18))
                                    .foregroundColor(Color.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        SearchBar()
                    }
                    .padding()
                    
                    Text("Popular Movies")
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
                    
                    Text("Recommended")
                        .font(Typography.medium(size: 18))
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    
                    VStack{
                        ForEach(viewModel.popularMovies, id: \.id) { movie in
                            HStack{
                                ImageLoader(url: "https://image.tmdb.org/t/p/w500" + movie.posterPath)
                                    .frame(width: 120, height: 120)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    
                }
            }
        }
        .onAppear{
            viewModel.fetchPopularMovies()
        }
        
        
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        HomeScreen(client: client, moviesRepositoryMock: MoviesRepositoryMock())
    }
}
