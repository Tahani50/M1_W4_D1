//
//  APIClient.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import Foundation
import Alamofire

// MARK: - APIClient

// A class responsible for handling network requests using Alamofire.
final class APIClient {
    
    // Shared instance for global access to APIClient
    static let shared = APIClient()
    
    // Alamofire Session used to perform network requests
    let session: Session
    
    // Private initializer to prevent external instantiation
    private init() {
        // Create a custom interceptor
        let interceptor = NetworkInterceptor()
        
        // Initialize Alamofire session with the custom interceptor
        session = Session(interceptor: interceptor)
    }
}
