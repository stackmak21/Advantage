//
//  HomeViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    private var tasks: [Task<Void, Never>] = []
    private let client: NetworkClient
    
    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    private let fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase
    
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    
    init(
        client: NetworkClient,
        moviesRepositoryMock: MoviesRepositoryContract? = nil
    ) {
        self.client = client
        self.fetchPopularMoviesUseCase = FetchPopularMoviesUseCase(client: client, moviesRepository: moviesRepositoryMock)
        self.fetchTopRatedMoviesUseCase = FetchTopRatedMoviesUseCase(client: client, moviesRepository: moviesRepositoryMock)
    }
    
    deinit{
        tasks.forEach({$0.cancel()})
    }
    
    
    func fetchPopularMovies() {
        let task = Task{
            let response = await fetchPopularMoviesUseCase.invoke()
            switch response {
            case .success(let result):
                popularMovies = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
        }
        tasks.append(task)
    }
    
    func fetchTopRatedMovies() {
        let task = Task{
            let response = await fetchPopularMoviesUseCase.invoke()
            switch response {
            case .success(let result):
                topRatedMovies = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
        }
        tasks.append(task)
    }
    
}
