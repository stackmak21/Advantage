//
//  MoviesSearchViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation
import SwiftfulRouting

@MainActor
class MoviesSearchViewModel: BaseViewModel{
    
    private let router: AnyRouter
    private var tasks: [Task<Void, Never>] = []
    private let client: NetworkClient
    
    private let searchByNameUseCase: SearchByNameUseCase
    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    
    @Published var searchedMovies: [Movie] = []
    @Published var searchText: String = ""
    
    @Published var isLoading: Bool = false
    
    init(
        client: NetworkClient,
        router: AnyRouter,
        moviesRepositoryMock: MoviesRepositoryContract? = nil
    ) {
        self.client = client
        self.router = router
        self.searchByNameUseCase = SearchByNameUseCase(client: client, moviesRepository: moviesRepositoryMock)
        self.fetchPopularMoviesUseCase = FetchPopularMoviesUseCase(client: client, moviesRepository: moviesRepositoryMock)
    }
    
    deinit{
        tasks.forEach({$0.cancel()})
    }
    
    
    func fetchRequestedMovies() {
        setLoading()
        let task = Task{
            let response = await searchByNameUseCase.invoke(movieName: searchText)
            switch response {
            case .success(let result):
                searchedMovies = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
            resetLoading()
        }
        tasks.append(task)
    }
    
    func fetchPopularMovies() {
        setLoading()
        let task = Task{
            let response = await fetchPopularMoviesUseCase.invoke()
            switch response {
            case .success(let result):
                searchedMovies = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
            resetLoading()
        }
        tasks.append(task)
    }
}

//MARK: - Navigation

extension MoviesSearchViewModel{
    
    func dismissScreen(){
        router.dismissScreen()
    }
    
    func navigateToMovieDetailsScreen(movieId: Int){
        router.showScreen(.push) { router in
            MovieDetailsScreen(client: self.client, movieId: movieId, router: self.router)
        }
    }
}
