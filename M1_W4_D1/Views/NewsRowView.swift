//
//  NewsRowView.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import SwiftUI

// MARK: - NewsRowView

struct NewsRowView: View {
    
    let article: NewsArticle
    
    var body: some View {
        VStack {
            // If the article has a valid image URL, load and display it using AsyncImage
            if let imageURL = URL(string: article.urlToImage ?? "") {
                AsyncImage(url: imageURL) { image in
                    // When the image loads successfully
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    // Placeholder shown while the image loads
                    Color.gray.opacity(0.3)
                }
                .cornerRadius(8) // Rounded corners for the image
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                
                Text(article.description ?? "")
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

