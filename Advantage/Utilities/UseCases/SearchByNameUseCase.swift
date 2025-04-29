//
//  SearchByNameUseCase.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

struct SearchByNameUseCase{
    
    private let repository: MoviesRepositoryContract
    
    init(client: NetworkClient, moviesRepository: MoviesRepositoryContract? = nil) {
        self.repository = moviesRepository ?? MoviesRepository(client: client)
    }
    
    func invoke(movieName: String) async -> Result<[Movie], MovieDBError> {
        return await repository.searchByName(movieName: movieName)
    }
}
