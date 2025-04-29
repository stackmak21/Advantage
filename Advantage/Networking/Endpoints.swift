//
//  Endpoints.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import Foundation


enum Endpoints{
    static let popularMovies = "/3/movie/popular"
    static let topRatedMovies = "/3/movie/top_rated"
    static let search = "/3/search/multi"
    static func movieDetails(movieId: Int) -> String {
        return "/3/movie/\(movieId)"
    }
    static func movieCredits(movieId: Int) -> String {
        return "/3/movie/\(movieId)/credits"
    }
}
