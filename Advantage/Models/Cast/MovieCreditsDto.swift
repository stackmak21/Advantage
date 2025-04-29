//
//  MovieCreditsDto.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

struct MovieCreditsDto: Codable {
    let id: Int?
    let cast: [CastMemberDto]?
}
