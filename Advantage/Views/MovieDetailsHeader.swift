//
//  MovieDetailsHeader.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import SwiftUI

struct MovieDetailsHeader: View {
    
    var height: CGFloat = 480
    var shadowColor: Color = Color.customBlack.opacity(1)
    
    let movieDetails: MovieDetails
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                ImageLoader(url: "https://image.tmdb.org/t/p/original" + movieDetails.backdropPath)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    HStack{
                        Text(movieDetails.originalTitle)
                            .font(Typography.bold(size: 26))
                            .foregroundColor(Color.customWhite)
                        Spacer()
                        HStack{
                            let rating = String(format: "%.1f", movieDetails.voteAverage.round(to: 1))
                            Text(rating)
                                .font(Typography.medium(size: 18))
                                .foregroundColor(Color.customWhite)
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .foregroundColor(Color.customLightYellow)
                        }
                    }
                    Text(movieDetails.releaseDate.formatDate(to: "YYYY"))
                        .font(Typography.regular(size: 18))
                        .foregroundColor(Color.customLightGray)
                    HStack{
                        ForEach(movieDetails.genres, id: \.id){ genre in
                            GenreTagView(genre: genre.name)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top, endPoint: .bottom)
                )
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.customBlack.ignoresSafeArea()
        
        ScrollView {
            MovieDetailsHeader(movieDetails: DeveloperPreview.movieDetails)
        }
        .ignoresSafeArea()
    }
}

