//
//  NewsItem.swift
//  GetTheNews
//
//  Created by Dipika Bari on 14/02/2025.
//

import Foundation

struct NewsItem: Identifiable {
    let id: Int
    let commentCount: Int
    let score: Int
    let author: String
    let title: String
    let date: Date
    let url: URL
}

extension NewsItem: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, score, title, url
        case commentCount = "descendants"
        case date = "time"
        case author = "by"
    }
}
