//
//  PopularMovieThumbnailView.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct PopularMovieThumbnailView: View {
    
    let movie: Movie
    let onClick: () -> Void
    
    var body: some View {
        Button(
            action: { onClick() },
              label: {
                  ZStack{
                      VStack{
                          ImageLoader(url: "https://image.tmdb.org/t/p/w200" + movie.posterPath)
                              .clipShape(RoundedRectangle(cornerRadius: 10))
                              .overlay{
                                  RoundedRectangle(cornerRadius: 10)
                                      .stroke(lineWidth: 1)
                                      .fill(Color.customIceWhite.opacity(0.1))
                              }
                              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                          VStack{
                              Text(movie.title)
                                  .font(Typography.medium(size: 16))
                                  .foregroundColor(Color.customIceWhite)
                                  .minimumScaleFactor(0.7)
                                  .lineLimit(1)
                                  .frame(maxWidth: .infinity, alignment: .leading)
                              Text(movie.releaseDate.formatDate(to: "YYYY"))
                                  .font(Typography.regular(size: 14))
                                  .foregroundColor(Color.customLightGray.opacity(0.8))
                                  .frame(maxWidth: .infinity, alignment: .leading)
                              HStack{
                                  RatingStarsView(rating: movie.voteAverage)
                                      .frame(width: 60)
                                  let rating = String(format: "%.1f", movie.voteAverage.round(to: 1))
                                  Text(rating)
                                      .font(Typography.regular(size: 12))
                                      .foregroundColor(Color.customIceWhite)
                                      .frame(maxWidth: .infinity, alignment: .leading)
                              }
                          }
                          .frame(maxWidth: .infinity, alignment: .leading)
                      }
                      .padding(10)
                  }
                  .background(
                      RoundedRectangle(cornerRadius: 16)
                          .fill(LinearGradient(colors: [.customBlack, .customDarkGray], startPoint: .top, endPoint: .bottom))
                          .shadow(color: .customBlack.opacity(0.2), radius: 6, x: 0, y: 2)
                  )
              }
        )
        .buttonStyle(PlainButtonStyle())
        

    }
}

#Preview {
    PopularMovieThumbnailView(movie: DeveloperPreview.popularMovieItem, onClick: {})
        .frame(width: 200, height: 260)
}
