//
//  AdvantageApp.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI

@main
struct AdvantageApp: App {
    
    let client: NetworkClient = NetworkClient()
    let keychain: KeychainManager = KeychainManager()
    
    init(){
        keychain.save(AppConstants.apiKey, key: .apiKey)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen(client: client)
            }
        }
    }
}


