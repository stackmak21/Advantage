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
    
    func fetchPopularMovies() async -> Result<[PopularMovieItem], MovieDBError> {
        return await moviesApi.fetchPopularMovies()
            .map({ $0.map({ $0.toPopularItem() }) })
            .mapError({ $0.toMovieDBError() })
    }
    
}
