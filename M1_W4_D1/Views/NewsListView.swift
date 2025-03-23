//
//  NewsListView.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import SwiftUI

// MARK: - NewsListView

// A SwiftUI view that displays a list of news articles with pagination support
struct NewsListView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    // Iterate through each article and display a row
                    ForEach(viewModel.articles, id: \.id) { article in
                        NewsRowView(article: article)
                    }
                    
                    // Show "Load More News" button only if more pages are available
                    if viewModel.currentPage <= viewModel.pageSize {
                        Button(action: {
                            // Load next page of news articles
                            viewModel.fetchNews()
                        }) {
                            Text("Load More News")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Top Headlines") 
            .onAppear {
                // Fetch news only once when the view appears
                if viewModel.articles.isEmpty {
                    viewModel.fetchNews()
                }
            }
        }
    }
}
