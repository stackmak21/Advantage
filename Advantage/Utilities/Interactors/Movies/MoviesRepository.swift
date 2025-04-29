//
//  MoviesRepository.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MoviesRepository: MoviesRepositoryContract {
    
    private let moviesApi: MoviesApi
    
    init(client: NetworkClient) {
        self.moviesApi = MoviesApi(client: client)
    }
    
    func fetchPopularMovies() async -> Result<[Movie], MovieDBError> {
        return await moviesApi.fetchPopularMovies()
            .map({ $0.map({ $0.toMovie() }) })
            .mapError({ $0.toMovieDBError() })
    }
    
    func fetchTopRatedMovies() async -> Result<[Movie], MovieDBError> {
        return await moviesApi.fetchTopRatedMovies()
            .map({ $0.map({ $0.toMovie() }) })
            .mapError({ $0.toMovieDBError() })
    }
    
    func searchByName(movieName: String) async -> Result<[Movie], MovieDBError> {
        return await moviesApi.searchByName(movieName: movieName)
            .map({ $0.map({ $0.toMovie() }) })
            .mapError({ $0.toMovieDBError() })
    }
    
    func fetchMovieDetails(movieId: Int) async -> Result<MovieDetails, MovieDBError> {
        return await moviesApi.fetchMovieDetails(movieId: movieId)
            .map({ $0.toMovieDetails()})
            .mapError({ $0.toMovieDBError() })
    }
    
    func fetchCastMembers(movieId: Int) async -> Result<[CastMember], MovieDBError>{
        return await moviesApi.fetchCastMembers(movieId: movieId)
            .map({$0.map({$0.toCastMember()})})
            .mapError({ $0.toMovieDBError() })
    }
    
}
