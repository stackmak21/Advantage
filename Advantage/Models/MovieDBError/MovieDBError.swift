//
//  MovieDBError.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation

struct MovieDBError: Error{
    let statusCode: Int
    let statusMessage: String
    let success: Bool
}


