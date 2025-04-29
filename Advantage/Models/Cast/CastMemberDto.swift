//
//  CastMemberDto.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import Foundation

struct CastMemberDto: Codable{
    let id: Int?
    let adult: Bool?
    let gender: Int?
    let knownForDepartment: String?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castId: Int?
    let character: String?
    let creditId: String?
    let order: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, adult, gender, name, popularity, character, order
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case castId = "cast_id"
        case creditId = "credit_id"
    }
    
    func toCastMember() -> CastMember {
        return CastMember(
            id: id ?? 0,
            adult: adult ?? false,
            gender: gender ?? 0,
            knownForDepartment: knownForDepartment ?? "",
            name: name ?? "",
            originalName: originalName ?? "",
            popularity: popularity ?? 0.0,
            profilePath: profilePath ?? "",
            castId: castId ?? 0,
            character: character ?? "",
            creditId: creditId ?? "",
            order: order ?? 0
        )
    }
}
