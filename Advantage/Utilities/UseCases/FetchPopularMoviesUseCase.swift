//
//  FetchPopularMoviesUseCase.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct FetchPopularMoviesUseCase{
    
    private let repository: MoviesRepositoryContract
    
    init(client: NetworkClient, moviesRepository: MoviesRepositoryContract? = nil) {
        self.repository = moviesRepository ?? MoviesRepository(client: client)
    }
    
    func invoke() async -> Result<[PopularMovieItem], MovieDBError> {
        Logger.success("thread check", showCurrentThread: true)
        return await repository.fetchPopularMovies()
    }
}
