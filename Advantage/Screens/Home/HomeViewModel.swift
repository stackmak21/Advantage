//
//  HomeViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation
import SwiftfulRouting

@MainActor
class HomeViewModel: BaseViewModel {
    
    private let router: AnyRouter
    private var tasks: [Task<Void, Never>] = []
    private let client: NetworkClient
    
    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    private let fetchTopRatedMoviesUseCase: FetchTopRatedMoviesUseCase
    
    @Published var popularMovies: [Movie] = RedactionHelper.movies
    @Published var topRatedMovies: [Movie] = RedactionHelper.movies
    
    @Published var isLoading: Bool = false
    @Published var isHitAllowed: Bool = true
    
    init(
        client: NetworkClient,
        moviesRepositoryMock: MoviesRepositoryContract? = nil,
        router: AnyRouter
    ) {
        self.client = client
        self.fetchPopularMoviesUseCase = FetchPopularMoviesUseCase(client: client, moviesRepository: moviesRepositoryMock)
        self.fetchTopRatedMoviesUseCase = FetchTopRatedMoviesUseCase(client: client, moviesRepository: moviesRepositoryMock)
        self.router = router
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
    
    func isReloadAllowed() -> Bool {
        if popularMovies == RedactionHelper.movies || topRatedMovies == RedactionHelper.movies {
            return true
        }
        return false
    }
    
    func hitDebounce(){
        Task{
            isHitAllowed = false
            try? await Task.sleep(seconds: 0.2)
            isHitAllowed = true
        }
    }
    
}

//MARK: - Navigation
extension HomeViewModel{
    
    func navigateToSearchScreen(){
        router.showScreen(.push) { router in
            MoviesSearchScreen(client: self.client, router: self.router)
        }
    }
    
    func navigateToMovieDetailsScreen(movieId: Int){
        router.showScreen(.push) { router in
            MovieDetailsScreen(client: self.client, movieId: movieId, router: self.router)
        }
    }
    
    func dismissScreen(){
        router.dismissScreen()
    }
}
