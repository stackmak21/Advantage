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
    
    func fetchPopularMovies() async -> Result<[MovieDto], MovieDBResponseRaw> {
        let apiKey = keychain.get(key: .apiKey) ?? ""
        let response: Result<MoviesDto?, MovieDBResponseRaw> = await client.execute(
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
    
    func fetchTopRatedMovies() async -> Result<[MovieDto], MovieDBResponseRaw> {
        let apiKey = keychain.get(key: .apiKey) ?? ""
        let response: Result<MoviesDto?, MovieDBResponseRaw> = await client.execute(
            host: Host.moviesDB,
            endpoint: Endpoints.topRatedMovies,
            queryItems: ["api_key": apiKey]
        )
        switch response{
        case .success(let topRatedMovies):
            if let movies = topRatedMovies?.results{
                return .success(movies)
            }
            return .failure(MovieDBResponseRaw())
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func searchByName(movieName: String) async -> Result<[MovieDto], MovieDBResponseRaw> {
        let apiKey = keychain.get(key: .apiKey) ?? ""
        let response: Result<MoviesDto?, MovieDBResponseRaw> = await client.execute(
            host: Host.moviesDB,
            endpoint: Endpoints.search,
            queryItems: [
                "api_key": apiKey,
                "query" : movieName,
                "page" : "1"
            ]
        )
        switch response{
        case .success(let topRatedMovies):
            if let movies = topRatedMovies?.results{
                return .success(movies)
            }
            return .failure(MovieDBResponseRaw())
        case .failure(let error):
            return .failure(error)
        }
    }
    
    
    func fetchMovieDetails(movieId: Int) async -> Result<MovieDetailsDto, MovieDBResponseRaw> {
        let apiKey = keychain.get(key: .apiKey) ?? ""
        let response: Result<MovieDetailsDto?, MovieDBResponseRaw> = await client.execute(
            host: Host.moviesDB,
            endpoint: Endpoints.movieDetails(movieId: movieId),
            queryItems: [
                "api_key": apiKey,
                "language": "en-US"
            ]
        )
        switch response{
        case .success(let selectedMovieDetails):
            if let movieDetails = selectedMovieDetails{
                return .success(movieDetails)
            }
            return .failure(MovieDBResponseRaw())
        case .failure(let error):
            return .failure(error)
        }
    }
    
    
    func fetchCastMembers(movieId: Int) async -> Result<[CastMemberDto], MovieDBResponseRaw> {
        let apiKey = keychain.get(key: .apiKey) ?? ""
        let response: Result<MovieCreditsDto?, MovieDBResponseRaw> = await client.execute(
            host: Host.moviesDB,
            endpoint: Endpoints.movieCredits(movieId: movieId),
            queryItems: [
                "api_key": apiKey,
                "language": "en-US"
            ]
        )
        switch response{
        case .success(let movieCredits):
            if let castMembers = movieCredits?.cast{
                return .success(castMembers)
            }
            return .failure(MovieDBResponseRaw())
        case .failure(let error):
            return .failure(error)
        }
    }
    
}


