//
//  MovieDetailsDto.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MovieDetailsDto: Codable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [GenreDto]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originCountry: [String]?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompanyDto]?
    let productionCountries: [ProductionCountryDto]?
    let releaseDate: String?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguageDto]?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toMovieDetails() -> MovieDetails {
        return MovieDetails(
            id: self.id ?? 0,
            adult: self.adult ?? false,
            backdropPath: self.backdropPath ?? "",
            budget: self.budget ?? 0,
            genres: self.genres?.map({$0.toGenre()}) ?? [],
            homepage: self.homepage ?? "",
            imdbID: self.imdbID ?? "",
            originCountry: self.originCountry ?? [],
            originalLanguage: self.originalLanguage ?? "",
            originalTitle: self.originalTitle ?? "",
            overview: self.overview ?? "",
            popularity: self.popularity ?? 0,
            posterPath: self.posterPath ?? "",
            productionCompanies: self.productionCompanies?.map({$0.toProductionCompany()}) ?? [],
            productionCountries: self.productionCountries?.map({$0.toProductionCountry()}) ?? [],
            releaseDate: self.releaseDate ?? "",
            revenue: self.revenue ?? 0,
            runtime: self.runtime ?? 0,
            spokenLanguages: self.spokenLanguages?.map({$0.toSpokenLanguage()}) ?? [],
            status: self.status ?? "",
            tagline: self.tagline ?? "",
            title: self.title ?? "",
            video: self.video ?? false,
            voteAverage: self.voteAverage ?? 0,
            voteCount: self.voteCount ?? 0
        )
    }
    
}

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
}

// MARK: - Genre
struct GenreDto: Codable {
    let id: Int?
    let name: String?
    
    func toGenre() -> Genre{
        Genre(
            id: self.id ?? 0,
            name: self.name ?? ""
        )
    }
}

struct Genre: Identifiable{
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompanyDto: Codable {
    let id: Int?
    let logoPath, name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
    func toProductionCompany() -> ProductionCompany{
        return ProductionCompany(
            id: self.id ?? 0,
            logoPath: self.logoPath ?? "",
            name: self.name ?? "",
            originCountry: self.originCountry ?? ""
        )
    }
}

struct ProductionCompany: Identifiable{
    let id: Int
    let logoPath, name, originCountry: String
}

// MARK: - ProductionCountry
struct ProductionCountryDto: Codable {
    let iso3166_1, name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
    
    func toProductionCountry() -> ProductionCountry{
        return ProductionCountry(
            iso3166_1: self.iso3166_1 ?? "",
            name: self.name ?? ""
        )
    }
}

struct ProductionCountry{
    let iso3166_1, name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguageDto: Codable {
    let englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
    
    func toSpokenLanguage() -> SpokenLanguage{
        return SpokenLanguage(
            englishName: self.englishName ?? "",
            iso639_1: self.iso639_1 ?? "",
            name: self.name ?? ""
        )
    }
}

struct SpokenLanguage {
    let englishName, iso639_1, name: String
}
