//
//  MoviesSearchViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

@MainActor
class MoviesSearchViewModel: ObservableObject{
    
    private var tasks: [Task<Void, Never>] = []
    private let client: NetworkClient
    
    private let searchByNameUseCase: SearchByNameUseCase
    
    @Published var searchedMovies: [Movie] = []
    @Published var searchText: String = ""
    
    init(
        client: NetworkClient,
        moviesRepositoryMock: MoviesRepositoryContract? = nil
    ) {
        self.client = client
        self.searchByNameUseCase = SearchByNameUseCase(client: client, moviesRepository: moviesRepositoryMock)
    }
    
    deinit{
        tasks.forEach({$0.cancel()})
    }
    
    
    func fetchRequestedMovies() {
        let task = Task{
            let response = await searchByNameUseCase.invoke(movieName: searchText)
            switch response {
            case .success(let result):
                searchedMovies = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
        }
        tasks.append(task)
    }
}
