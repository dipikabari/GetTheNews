//
//  Entry.swift
//  GetTheNews
//
//  Created by Dipika Bari on 14/02/2025.
//

import SwiftUI

struct Entry: View {
    let title: String
    let footnote: String
    let score: Int
    let commentCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(title)
                .font(.headline)
            Text(footnote)
                .font(.footnote)
                .foregroundColor(.secondary)
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                Label(score.formatted(), systemImage: "arrowtriangle.up.circle")
                    .foregroundStyle(.blue)
                Label(commentCount.formatted(), systemImage: "ellipses.bubble")
                    .foregroundStyle(.orange)
                    .padding(.leading, 96.0)
            }
            .font(.footnote)
            .labelStyle(.titleAndIcon)
        }
    }
}

struct Entry_Previews: PreviewProvider {
    static var previews: some View {
        Entry(title: "PlaceholderTitle", footnote: "PlaceholderFootnote", score: 1425, commentCount: 225)
    }
}
