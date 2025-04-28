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
    
    init(
        client: NetworkClient
    ) {
        self.client = client
    }
    
}
