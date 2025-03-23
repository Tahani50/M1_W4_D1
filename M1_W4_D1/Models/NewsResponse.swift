//
//  NewsArtical.swift
//  M1_W4_D1
//
//  Created by Taibah Valley Academy on 3/23/25.
//

import Foundation

struct NewsResponse: Decodable {
    let articles: [NewsArticle]
}

struct NewsArticle: Identifiable, Decodable {
    var id: UUID { UUID() }
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let content: String?
}

