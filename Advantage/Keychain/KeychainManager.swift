//
//  KeychainManager.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation
import KeychainSwift


final class KeychainManager {
    
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func save(_ value: String, key: KeychainKeys){
        keychain.set(value, forKey: key.rawValue)
    }
    
    func get(key: KeychainKeys) -> String? {
        keychain.get(key.rawValue)
    }
    
    enum KeychainKeys: String {
        case apiKey
    }
    
}
