//
//  UserDefaultsHelper.swift
//  AlamofireAPI
//
//  Created by Zohaib Afzal on 20/03/2025.
//

import Foundation

// MARK: - UserDefaults Helper

// A helper class to manage saving, retrieving, and removing the auth token using UserDefaults
class UserDefaultsHelper {
    
    // Shared instance for accessing UserDefaultsHelper
    static let shared = UserDefaultsHelper()
    
    // Saves the authentication token to UserDefaults
    func saveToken(_ token: String) {
        UserDefaults.standard.setValue(token, forKey: "authToken")
    }
    
    // Retrieves the authentication token from UserDefaults
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: "authToken")
    }
    
    // Removes the authentication token from UserDefaults
    func removeToken() {
        UserDefaults.standard.removeObject(forKey: "authToken")
    }
}

