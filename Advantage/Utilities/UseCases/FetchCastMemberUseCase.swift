//
//  FetchCastMemberUseCase.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

struct FetchCastMemberUseCase{
    
    private let repository: MoviesRepositoryContract
    
    init(client: NetworkClient, moviesRepository: MoviesRepositoryContract? = nil) {
        self.repository = moviesRepository ?? MoviesRepository(client: client)
    }
    
    func invoke(movieId: Int) async -> Result<[CastMember], MovieDBError> {
        return await repository.fetchCastMembers(movieId: movieId)
    }
}
