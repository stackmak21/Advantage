//
//  FetchMovieDetailsUseCase.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation


struct FetchMovieDetailsUseCase{
    
    private let repository: MoviesRepositoryContract
    
    init(client: NetworkClient, moviesRepository: MoviesRepositoryContract? = nil) {
        self.repository = moviesRepository ?? MoviesRepository(client: client)
    }
    
    func invoke(movieId: Int) async -> Result<MovieDetails, MovieDBError> {
        return await repository.fetchMovieDetails(movieId: movieId)
    }
}
