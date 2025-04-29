//
//  MoviesRepositoryMock.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MoviesRepositoryMock: MoviesRepositoryContract{
    
    func fetchPopularMovies() async -> Result<[Movie], MovieDBError>{
        try? await Task.sleep(seconds: 2)
        return .success(DeveloperPreview.popularMovies)
    }
    
    func fetchTopRatedMovies() async -> Result<[Movie], MovieDBError>{
        return .success(DeveloperPreview.popularMovies)
    }
    
    func searchByName(movieName: String) async -> Result<[Movie], MovieDBError>{
        return .success(DeveloperPreview.popularMovies)
    }
    
    func fetchMovieDetails(movieId: Int) async -> Result<MovieDetails, MovieDBError> {
        try? await Task.sleep(seconds: 2)
        return .success(DeveloperPreview.movieDetails)
    }
    
    func fetchCastMembers(movieId: Int) async -> Result<[CastMember], MovieDBError>{
        return .success(DeveloperPreview.castMembers)
    }
}
