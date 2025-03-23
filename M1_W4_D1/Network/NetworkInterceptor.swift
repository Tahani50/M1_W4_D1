//
//  NetworkInterceptor.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import Alamofire
import Foundation

// MARK: - NetworkInterceptor

// A custom Alamofire RequestInterceptor to automatically add the auth token to each request
final class NetworkInterceptor: RequestInterceptor {

    // This method is called before a request is sent.
    // It allows modification of the request
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        // Retrieve the token from UserDefaults and add it to the Authorization header
        if let token = UserDefaultsHelper.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        print("\n=============================")
        print("🛠 URL: \(request.url?.absoluteString ?? "")")
        print("🔑 Authorization: \(request.value(forHTTPHeaderField: "Authorization") ?? "No Token")")
        print("=============================\n")
        
        // Return the modified request
        completion(.success(request))
    }
}
