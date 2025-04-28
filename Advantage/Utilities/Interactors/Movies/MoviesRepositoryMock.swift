//
//  MoviesRepositoryMock.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MoviesRepositoryMock: MoviesRepositoryContract{
    func fetchPopularMovies() async -> Result<[PopularMovieItem], MovieDBError>{
        return .success(DeveloperPreview.popularMovies)
    }
}
