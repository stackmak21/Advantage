//
//  MovieDetailsScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    
    init(client: NetworkClient, movieId: Int, moviesRepositoryMock: MoviesRepositoryContract? = nil) {
        self._viewModel = StateObject(wrappedValue: MovieDetailsViewModel(client: client, movieId: movieId, moviesRepositoryMock: moviesRepositoryMock))
    }
    var body: some View {
        ZStack{
            Color.customBlack.ignoresSafeArea()
            VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    MovieDetailsHeader(movieDetails: viewModel.movieDetails)
                    Text(viewModel.movieDetails.overview)
                        .font(Typography.light(size: 14))
                        .foregroundColor(Color.customWhite)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Text("Cast")
                        .font(Typography.medium(size: 18))
                        .foregroundColor(Color.customWhite)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20){
                            ForEach(viewModel.castMembers, id: \.id) { member in
                                if member.order < 10 {
                                    VStack{
                                        ImageLoader(url: "https://image.tmdb.org/t/p/w500" + member.profilePath)
                                            .frame(width: 100, height: 140)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        Text(member.originalName)
                                            .font(Typography.medium(size: 14))
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color.customWhite)
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                        Text(member.character)
                                            .font(Typography.medium(size: 12))
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                            .foregroundColor(Color.customWhite.opacity(0.6))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .frame(width: 100, height: 200, alignment: .top)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .overlay(alignment: .topLeading) {
                    BackButtonView(onBackClicked: { dismiss() })
                        .padding(.horizontal)
                }
               
                Spacer()
            }
            .ignoresSafeArea(.all, edges: [.bottom])
            
        }
        .onAppear {
            viewModel.fetchMovieDetails()
        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    NavigationView {
        MovieDetailsScreen(client: client, movieId: 500, moviesRepositoryMock: MoviesRepositoryMock())
    }
    
}


//ZStack{
//    Rectangle()
//        .fill(LinearGradient(colors: [.black.opacity(0.1), .black], startPoint: .top, endPoint: .bottom))
//        .frame(height: proxy.size.height / 2)
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//    HStack{
//        VStack{
//            HStack{
//                Text(viewModel.movieDetails.originalTitle)
//                    .font(Typography.bold(size: 22))
//                    .foregroundColor(Color.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                Spacer()
//                let rating = String(format: "%.1f", viewModel.movieDetails.voteAverage.round(to: 1))
//                Text(rating)
//                    .font(Typography.medium(size: 18))
//                    .foregroundColor(Color.white)
//                Image(systemName: "star.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 20)
//                    .foregroundColor(Color.yellow.opacity(0.8))
//            }
//            Text(viewModel.movieDetails.releaseDate.formatDate(to: "YYYY"))
//                .font(Typography.regular(size: 16))
//                .foregroundColor(Color.gray)
//                .frame(maxWidth: .infinity, alignment: .leading)
//            HStack{
//                ForEach(viewModel.movieDetails.genres, id: \.id){ genre in
//                    GenreTagView(genre: genre.name)
//                }
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//        }
//        Spacer()
//
//
//    }
//    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//}
