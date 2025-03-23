//
//  APIKeyManager.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import Foundation

// MARK: - API Key Manager

// A class to securely retrieve the API key from multiple possible sources
class APIKeyManager {
    
    // Shared instance for global access
    static let shared = APIKeyManager()
    
    // Retrieves the API key from multiple fallback sources in order of priority
    func getAPIKey() -> String {
        
        // 1. Try to fetch the key from the Keychain
        if let keychainKey = SecureStorage.shared.getFromKeychain() {
            return keychainKey
        }
        
        // 2. Try to fetch the key from a local Secrets.plist file
        if let plistKey = getAPIKeyFromPlist() {
            return plistKey
        }
        
        // 3. Try to fetch the key from environment variables
        if let envKey = ProcessInfo.processInfo.environment["NEWS_API_KEY"] {
            return envKey
        }
        
        // 4. Return fallback value if all sources fail
        return "No_API_Key_Found"
    }
    
    // Helper method to retrieve the API key from a Secrets.plist file
    private func getAPIKeyFromPlist() -> String? {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            return dict["NewsAPIKey"] as? String
        }
        return nil
    }
}
