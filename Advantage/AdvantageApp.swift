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
        configureNavigationBar()
        keychain.save(AppConstants.apiKey, key: .apiKey)
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                HomeScreen(client: client, router: router)
            }
        }
    }
    
        private func configureNavigationBar() {
            let backgroundColor = UIColor(Color.customWhite)
            let foregroundColor = UIColor(Color.customBlack)
    
            let coloredAppearance = UINavigationBarAppearance()
            coloredAppearance.configureWithOpaqueBackground()
            coloredAppearance.backgroundColor = backgroundColor
            coloredAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
            coloredAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
    
            UINavigationBar.appearance().standardAppearance = coloredAppearance
            UINavigationBar.appearance().compactAppearance = coloredAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            UINavigationBar.appearance().tintColor = foregroundColor
        }
}


