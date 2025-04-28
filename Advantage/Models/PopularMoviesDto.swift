//
//  PopularMoviesDto.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import Foundation


struct PopularMoviesDto: Codable {
    let page: Double?
    let results: [PopularMovieItemDto]?
    let totalPages: Double?
    let totalResults: Double?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


