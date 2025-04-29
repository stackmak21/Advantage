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
            video: false,
            voteAverage: 6.307,
            voteCount: 429
        )
    }
}
