//
//  NewsViewModels.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import Foundation
import Alamofire

// MARK: - NewsViewModel

// ViewModel responsible for fetching and managing news articles from the News API
class NewsViewModel: ObservableObject {
    
    // Published properties to update the UI
    @Published var articles: [NewsArticle] = []
    @Published var currentPage = 1                   // Current page for pagination
    @Published var pageSize = 20                     // Number of articles per page
    @Published var isLoading = false
   
    // Base URL for the News API
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=us"

    // Fetches news articles from the API using the current page and appends them to the list
    func fetchNews() {
        
        guard !isLoading else { return }

        // Set loading state
        isLoading = true
        
        // Store API key in Keychain for demonstration
        SecureStorage.shared.saveToKeychain(key: "f1a64c4839e5483995fa05a598fc9114")
        
        // Retrieve the API key from secure sources
        let apiKey = APIKeyManager.shared.getAPIKey()
        
        // Construct the full URL with pagination and API key
        let urlStr = "\(baseURL)&page=\(currentPage)&apiKey=\(apiKey)"
        
        // Debug logging
        print("\n🌍 API REQUEST: Fetch Users")
        print("🔗 URL: \(urlStr)")
        print("🛠 Method: GET\n")
        
        // Perform GET request using Alamofire
        AF.request(urlStr, method: .get)
            .validate() // Automatically validates HTTP status codes and content type
            .responseDecodable(of: NewsResponse.self) { response in
                switch response.result {
                case .success(let data):
                    // Append new articles and increment the page number
                    self.articles.append(contentsOf: data.articles)
                    self.currentPage += 1
                    print("✅ Articles Loaded: \(data.articles.count)")

                case .failure(let error):
                    print("❌ API Error: \(error.localizedDescription)")
                }
                self.isLoading = false
            }
    }
}
