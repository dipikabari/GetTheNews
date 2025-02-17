//
//  ViewModel.swift
//  GetTheNews
//
//  Created by Dipika Bari on 14/02/2025.
//

import Foundation

//@ObservableObject
class ViewModel: ObservableObject {
    @Published var stories: [NewsItem] = []
    
    func fetchTopStories() async throws {
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/beststories.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let ids = try JSONDecoder().decode([Int].self, from: data)
        stories = try await withThrowingTaskGroup(of: NewsItem.self) { group in
            for id in ids.prefix(10) {
                group.addTask {
                    return try await self.fetchStory(withID: id)
                }
            }
            var stories: [NewsItem] = []
            for try await item in group {
                stories.append(item)
            }
            return stories
        }
    }
    
    private func fetchStory(withID id: Int) async throws -> NewsItem {
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return try decoder.decode(NewsItem.self, from: data)
    }
}
