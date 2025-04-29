//
//  PopularMovieItem.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import Foundation

struct Movie: Identifiable, Equatable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let mediaType: MediaType
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var isValid: Bool {
        !backdropPath.isEmpty &&
        !overview.isEmpty &&
        !posterPath.isEmpty &&
        !releaseDate.isEmpty &&
        !title.isEmpty &&
        voteAverage > 0 &&
        voteCount > 0 
    }
}
