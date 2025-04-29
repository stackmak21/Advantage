//
//  MovieDBResponseRaw.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MovieDBResponseRaw: Codable, Error {
    let statusCode: Int?
    let statusMessage: String?
    let success: Bool?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
    
    init(
        statusCode: Int? = nil,
        statusMessage: String? = nil,
        success: Bool? = nil
    ) {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
        self.success = success
    }
    
    func toMovieDBError() -> MovieDBError {
        return MovieDBError(
            statusCode: self.statusCode ?? 0,
            statusMessage: self.statusMessage ?? "",
            success: self.success ?? false
        )
    }
}

