//
//  MoviesRepositoryMock.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MoviesRepositoryMock: MoviesRepositoryContract{
    
    func fetchPopularMovies() async -> Result<[Movie], MovieDBError>{
        return .success(DeveloperPreview.popularMovies)
    }
    
    func fetchTopRatedMovies() async -> Result<[Movie], MovieDBError>{
        return .success(DeveloperPreview.popularMovies)
    }
}
