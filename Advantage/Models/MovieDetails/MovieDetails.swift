//
//  MovieDetails.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

struct MovieDetails{
    let id: Int
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let imdbID: String
    let originCountry: [String]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    init(
        id: Int = 0,
        adult: Bool = false,
        backdropPath: String = "",
        budget: Int = 0,
        genres: [Genre] = [],
        homepage: String = "",
        imdbID: String = "",
        originCountry: [String] = [],
        originalLanguage: String = "",
        originalTitle: String = "",
        overview: String = "",
        popularity: Double = 0.0,
        posterPath: String = "",
        productionCompanies: [ProductionCompany] = [],
        productionCountries: [ProductionCountry] = [],
        releaseDate: String = "",
        revenue: Int = 0,
        runtime: Int = 0,
        spokenLanguages: [SpokenLanguage] = [],
        status: String = "",
        tagline: String = "",
        title: String = "",
        video: Bool = false,
        voteAverage: Double = 0.0,
        voteCount: Int = 0
    ) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.imdbID = imdbID
        self.originCountry = originCountry
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
