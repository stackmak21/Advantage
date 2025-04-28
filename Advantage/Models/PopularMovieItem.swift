//
//  PopularMovieItem.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import Foundation

struct PopularMovieItem: Identifiable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
