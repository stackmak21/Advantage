//
//  MovieDetailsViewModel.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

@MainActor
class MovieDetailsViewModel: ObservableObject {
    
    private var tasks: [Task<Void, Never>] = []
    private let client: NetworkClient
    
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    private let fetchCastMembersUseCase: FetchCastMemberUseCase
    
    private let movieId: Int
    
    @Published var movieDetails: MovieDetails = MovieDetails()
    @Published var castMembers: [CastMember] = []
    
    init(
        client: NetworkClient,
        movieId: Int,
        moviesRepositoryMock: MoviesRepositoryContract? = nil
    ) {
        self.client = client
        self.movieId = movieId
        self.fetchMovieDetailsUseCase = FetchMovieDetailsUseCase(client: client, moviesRepository: moviesRepositoryMock)
        self.fetchCastMembersUseCase = FetchCastMemberUseCase(client: client, moviesRepository: moviesRepositoryMock)
    }
    
    deinit{
        tasks.forEach({$0.cancel()})
    }
    
    func fetchMovieDetails(){
        let task = Task{
            await withTaskGroup(of: Void.self) { group in
                group.addTask {
                    await self.fetchMovieDetailsData()
                }
                group.addTask {
                    await self.fetchCastMembers()
                }
            }
        }
        tasks.append(task)
    }
    
    private func fetchMovieDetailsData() async {
            let response = await fetchMovieDetailsUseCase.invoke(movieId: movieId)
            switch response {
            case .success(let movieDetails):
                self.movieDetails = movieDetails
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
    }
    
    private func fetchCastMembers() async {
        let response = await fetchCastMembersUseCase.invoke(movieId: movieId)
            switch response {
            case .success(let result):
                castMembers = result
            case .failure(let error):
                Logger.error(error.statusMessage, showCurrentThread: true)
            }
    }
}
