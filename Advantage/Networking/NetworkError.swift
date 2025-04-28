//
//  NetworkError.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//


enum NetworkError: Error {
    case unknown
    case unauthorized
    case badUrlResponse
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
    case invalidUrl(_ errorDescription: String)
    
    func errorDescription() -> String {
        switch self {
        case .unauthorized:
            return "Unauthorized."
        case .badUrlResponse:
            return "Bad URL response."
        case .invalidRequest:
            return "Invalid request."
        case .badResponse:
            return "Bad response."
        case .badStatus:
            return "Bad status."
        case .failedToDecodeResponse:
            return "Failed to decode response."
        case .invalidUrl(let error):
            return "Invalid url \(error)."
        case .unknown:
            return "Unknown Error."
        }
    }
    
}