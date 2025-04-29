//
//  MoviePreviewCellCiew.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import SwiftUI

struct MoviePreviewCellCiew: View {
    let movie: Movie
    let onClick: () -> Void
    
    var body: some View {
        HStack{
            ImageLoader(url: "https://image.tmdb.org/t/p/w500" + movie.posterPath)
                .frame(width: 80, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack{
                Text(movie.releaseDate.formatDate(to: "YYYY"))
                    .font(Typography.regular(size: 12))
                    .foregroundColor(Color.customBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(movie.title)
                    .font(Typography.bold(size: 14))
                    .foregroundColor(Color.customBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(movie.overview)
                    .font(Typography.light(size: 12))
                    .lineLimit(2)
                    .foregroundColor(Color.customBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 4){
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16)
                        .foregroundColor(Color.customYellow)
                    let rating = String(format: "%.1f", movie.voteAverage.round(to: 1))
                    Text(rating)
                        .font(Typography.medium(size: 12))
                        .foregroundColor(Color.customBlack)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.customWhite)
                .shadow(color: .customBlack.opacity(0.2), radius: 6, x: 0, y: 2)
            
        )
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    MoviePreviewCellCiew(movie: DeveloperPreview.popularMovieItem, onClick: {})
}
