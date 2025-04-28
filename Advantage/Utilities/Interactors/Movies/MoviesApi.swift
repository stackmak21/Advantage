//
//  MoviesApi.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

// https://api.themoviedb.org/3/movie/popular?api_key=6b2e856adafcc7be98bdf0d8b076851c
// "3/movie/popular"
// api key: 6b2e856adafcc7be98bdf0d8b076851c

struct MoviesApi {
    
    private let client: NetworkClient
    private let keychain: KeychainManager = KeychainManager()

    init(client: NetworkClient) {
        self.client = client
    }
    
    func fetchPopularMovies() async -> Result<[PopularMovieItemDto], MovieDBResponseRaw> {
        let apiKey = keychain.get(key: .apiKey) ?? ""
        let response: Result<PopularMoviesDto?, MovieDBResponseRaw> = await client.execute(
            host: Host.moviesDB,
            endpoint: Endpoints.popularMovies,
            queryItems: ["api_key": apiKey]
        )
        switch response{
        case .success(let popularMovies):
            if let movies = popularMovies?.results{
                return .success(movies)
            }
            return .failure(MovieDBResponseRaw())
        case .failure(let error):
            return .failure(error)
        }
    }
}


