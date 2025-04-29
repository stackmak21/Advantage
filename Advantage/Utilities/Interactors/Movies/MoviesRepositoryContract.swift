//
//  MoviesRepositoryContract.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

protocol MoviesRepositoryContract{
    func fetchPopularMovies() async -> Result<[Movie], MovieDBError>
    func fetchTopRatedMovies() async -> Result<[Movie], MovieDBError>
    func searchByName(movieName: String) async -> Result<[Movie], MovieDBError>
    func fetchMovieDetails(movieId: Int) async -> Result<MovieDetails, MovieDBError> 
    func fetchCastMembers(movieId: Int) async -> Result<[CastMember], MovieDBError> 
}
