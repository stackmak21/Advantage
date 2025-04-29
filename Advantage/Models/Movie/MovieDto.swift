//
//  PopularMovieItemDto.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MovieDto: Codable {
    
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toMovie() -> Movie{
        return Movie(
            id: self.id ?? 0,
            adult: self.adult ?? false,
            backdropPath: self.backdropPath ?? "",
            genreIds: self.genreIds ?? [],
            originalLanguage: self.originalLanguage ?? "",
            originalTitle: self.originalTitle ?? "",
            overview: self.overview ?? "",
            popularity: self.popularity ?? 0,
            posterPath: self.posterPath ?? "",
            releaseDate: self.releaseDate ?? "",
            title: self.title ?? "",
            video: self.video ?? false,
            voteAverage: self.voteAverage ?? 0,
            voteCount: self.voteCount ?? 0
        )
    }
    
}
