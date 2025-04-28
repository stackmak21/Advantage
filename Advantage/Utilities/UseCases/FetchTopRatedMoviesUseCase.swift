//
//  FetchTopRatedMoviesUseCase.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import Foundation


struct FetchTopRatedMoviesUseCase{
    
    private let repository: MoviesRepositoryContract
    
    init(client: NetworkClient, moviesRepository: MoviesRepositoryContract? = nil) {
        self.repository = moviesRepository ?? MoviesRepository(client: client)
    }
    
    func invoke() async -> Result<[Movie], MovieDBError> {
        return await repository.fetchTopRatedMovies()
    }
}
