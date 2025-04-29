//
//  MovieDetailsScreen.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI
import SwiftfulRouting

struct MovieDetailsScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    
    init(client: NetworkClient, movieId: Int, router: AnyRouter, moviesRepositoryMock: MoviesRepositoryContract? = nil) {
        self._viewModel = StateObject(wrappedValue: MovieDetailsViewModel(client: client, router: router, movieId: movieId, moviesRepositoryMock: moviesRepositoryMock))
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
                    Text(Strings.cast)
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
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color.customWhite.opacity(0.6))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .frame(width: 100, height: 210, alignment: .top)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .overlay(alignment: .topLeading) {
                    BackButtonView(onBackClicked: {
                        dismiss()
                    })
                    .unredacted()
                    .padding(.horizontal)
                }
               
                Spacer()
            }
            .ignoresSafeArea(.all, edges: [.bottom])
            
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
        .onAppear {
            viewModel.fetchMovieDetails()
        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    let client: NetworkClient = NetworkClient()
    RouterView{ router in
        MovieDetailsScreen(client: client, movieId: 500, router: router, moviesRepositoryMock: MoviesRepositoryMock())
    }
    
}
