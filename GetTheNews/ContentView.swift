//
//  ContentView.swift
//  GetTheNews
//
//  Created by Dipika Bari on 14/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ViewModel()
    
        var body: some View {
            List(model.stories) { story in
                Entry(story: story)
            }
            .listStyle(.plain)
            .navigationTitle("News")
            .task {
                try? await model.fetchTopStories()
            }
        }
}

extension Entry {
    init(story: NewsItem) {
        title = story.title
        score = story.score
        commentCount = story.commentCount
        footnote = (story.url.host() ?? "")
        + " - \(story.date.formatted(.relative(presentation: .numeric)))"
        + " - by \(story.author)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
