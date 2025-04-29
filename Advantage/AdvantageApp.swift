//
//  AdvantageApp.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import SwiftUI
import SwiftfulRouting

@main
struct AdvantageApp: App {
    
    let client: NetworkClient = NetworkClient()
    let keychain: KeychainManager = KeychainManager()
    
    init(){
        keychain.save(AppConstants.apiKey, key: .apiKey)
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                HomeScreen(client: client, router: router)
            }
        }
    }
}


