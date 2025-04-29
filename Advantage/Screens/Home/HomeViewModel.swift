//
//  HomeViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

@MainActor
class HomeViewModel: BaseViewModel {
    
    private var tasks: [Task<Void, Never>] = []
    private let client: NetworkClient
    
    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    private let fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase
    
    @Published var popularMovies: [Movie] = RedactionHelper.movies
    @Published var topRatedMovies: [Movie] = RedactionHelper.movies
    
    @Published var isLoading: Bool = false
    
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
    
    
    private func fetchPopularMovies() async {
        let response = await fetchPopularMoviesUseCase.invoke()
        switch response {
        case .success(let result):
            popularMovies = result
        case .failure(let error):
            Logger.error(error.statusMessage, showCurrentThread: true)
        }
    }
    
    private func fetchTopRatedMovies() async {
        let response = await fetchTopRatedMoviesUseCase.invoke()
            switch response {
            case .success(let result):
                topRatedMovies = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
        }
    }
    
    func fetchHomeMovies(){
        setLoading()
        let task = Task{
            await withTaskGroup(of: Void.self) { group in
                group.addTask {
                    await self.fetchPopularMovies()
                }
                group.addTask {
                    await self.fetchTopRatedMovies()
                }
            }
            await MainActor.run {
                resetLoading()
            }
        }
        tasks.append(task)
    }
    
}
