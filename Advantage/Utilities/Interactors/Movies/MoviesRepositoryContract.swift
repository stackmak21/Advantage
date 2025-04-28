//
//  MoviesRepositoryContract.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

protocol MoviesRepositoryContract{
    func fetchPopularMovies() async -> Result<[PopularMovieItem], MovieDBError>
}
