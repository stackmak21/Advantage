//
//  RedactionHelper.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation


struct RedactionHelper{
    
    static var movies: [Movie] {
        var popularMovies: [Movie] = []
        for i in 1...10{
            popularMovies.append(movieItem(i))
        }
        return popularMovies
    }
    
    
    private static func movieItem(_ id: Int) -> Movie {
        return Movie(
            id: 1197 + id,
            adult: false,
            backdropPath: "/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg",
            genreIds: [28, 80, 53],
            originalLanguage: "en",
            originalTitle: "A Working Man",
            overview: "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.",
            popularity: 798.7089,
            posterPath: "/xUkUZ8eOnrOnnJAfusZUqKYZiDu.jpg",
            releaseDate: "2025-03-26",
            title: "A Working Man",
            mediaType: .movie,
            video: false,
            voteAverage: 6.307,
            voteCount: 429
        )
    }
    
    static var castMembers: [CastMember] {
        var castMembersItems: [CastMember] = []
        for i in 1...10{
            castMembersItems.append(castMember(i))
        }
        return castMembersItems
    }
    
    static let movieDetails = MovieDetails(
            id: 1197306,
            adult: false,
            backdropPath: "/fTrQsdMS2MUw00RnzH0r3JWHhts.jpg",
            budget: 40000000,
            genres: [
                Genre(id: 28, name: "Action"),
                Genre(id: 80, name: "Crime"),
                Genre(id: 53, name: "Thriller")
            ],
            homepage: "https://www.amazon.com/salp/aworkingman?hhf",
            imdbID: "tt9150192",
            originCountry: ["GB", "US"],
            originalLanguage: "en",
            originalTitle: "A Working Man",
            overview: "Levon Cade left behind a decorated military career in the black ops to live a simple life working construction. But when his boss's daughter, who is like family to him, is taken by human traffickers, his search to bring her home uncovers a world of corruption far greater than he ever could have imagined.",
            popularity: 633.0389,
            posterPath: "/xUkUZ8eOnrOnnJAfusZUqKYZiDu.jpg",
            productionCompanies: [
                ProductionCompany(id: 118475, logoPath: "/x8mwqWGZK2gQvrp5QlYQho1VgXj.png", name: "Cedar Park Entertainment", originCountry: "US"),
                ProductionCompany(id: 219295, logoPath: "", name: "BlockFilm", originCountry: "US"),
                ProductionCompany(id: 218150, logoPath: "", name: "Punch Palace Productions", originCountry: "GB"),
                ProductionCompany(id: 166120, logoPath: "/fRuHQF9DB4Zl3ha62D5Bpu1a5TL.png", name: "Balboa Productions", originCountry: "US"),
                ProductionCompany(id: 22146, logoPath: "/v37N1mFeXNQfvPankg3feBhVvM7.png", name: "Black Bear Pictures", originCountry: "US"),
                ProductionCompany(id: 181874, logoPath: "/crrgXvLhDO9c57HYrbO4H58Vxmb.png", name: "Fifth Season", originCountry: "US"),
                ProductionCompany(id: 253169, logoPath: "", name: "CAT5", originCountry: "US")
            ],
            productionCountries: [
                ProductionCountry(iso3166_1: "GB", name: "United Kingdom"),
                ProductionCountry(iso3166_1: "US", name: "United States of America")
            ],
            releaseDate: "2025-03-26",
            revenue: 87414615,
            runtime: 116,
            spokenLanguages: [
                SpokenLanguage(englishName: "English", iso639_1: "en", name: "English"),
                SpokenLanguage(englishName: "Russian", iso639_1: "ru", name: "Pусский"),
                SpokenLanguage(englishName: "Spanish", iso639_1: "es", name: "Español")
            ],
            status: "Released",
            tagline: "Human traffickers beware.",
            title: "A Working Man",
            video: false,
            voteAverage: 6.346,
            voteCount: 471
        )
    
    private static func castMember(_ id: Int) -> CastMember{
        return CastMember(
        id: 976 + id,
        adult: false,
        gender: 2,
        knownForDepartment: "Acting",
        name: "Jason Statham",
        originalName: "Jason Statham",
        popularity: 27.5911,
        profilePath: "/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg",
        castId: 7,
        character: "Levon Cade",
        creditId: "653c591c519bbb00fe5be666",
        order: 0
        )
    }
}
