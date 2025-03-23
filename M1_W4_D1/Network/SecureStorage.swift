//
//  SecureStorage.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import Foundation

// MARK: - SecureStorage

// A class for securely saving and retrieving data using the iOS Keychain
class SecureStorage {
    
    // Shared instance for global access
    static let shared = SecureStorage()
    
    // Saves a key-value pair to the Keychain
    func saveToKeychain(key: String = "", value: String = "NewsAPIKey") {
        // Convert the string into Data format
        let data = key.data(using: .utf8)!
        
        // Prepare the query for saving the data
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,     // Generic password class
            kSecAttrAccount as String: value,                  // Identifier for the data
            kSecValueData as String: data                      // The actual data to store
        ]
        
        // Delete any existing item with the same identifier
        SecItemDelete(query as CFDictionary)
        
        // Add the new item to the Keychain
        SecItemAdd(query as CFDictionary, nil)
    }

    // Retrieves a value from the Keychain for the specified identifier
    func getFromKeychain(value: String = "NewsAPIKey") -> String? {
        // Prepare the query for fetching the data
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,     // Generic password class
            kSecAttrAccount as String: value,                  // Identifier for the data
            kSecReturnData as String: kCFBooleanTrue!,         // Request the actual data
            kSecMatchLimit as String: kSecMatchLimitOne        // Limit to one result
        ]

        var result: AnyObject?
        
        // Attempt to retrieve the item from the Keychain
        if SecItemCopyMatching(query as CFDictionary, &result) == noErr,
           let data = result as? Data {
            // Convert data back to a string
            return String(data: data, encoding: .utf8)
        }
        
        return nil
    }
}
