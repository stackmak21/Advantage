//
//  PopularMovieThumbnailView.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct PopularMovieThumbnailView: View {
    
    let movie: Movie
    
    var body: some View {
        ZStack{
            VStack{
                ImageLoader(url: "https://image.tmdb.org/t/p/w500" + movie.posterPath)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                VStack{
                    Text(movie.title)
                        .font(Typography.medium(size: 16))
                        .foregroundColor(Color.white)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(movie.releaseDate)
                        .font(Typography.regular(size: 14))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    RatingStarsView(rating: movie.voteAverage)
                        .frame(width: 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(colors: [.black, .black.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
        }

    }
}

#Preview {
    PopularMovieThumbnailView(movie: DeveloperPreview.popularMovieItem)
        
}
