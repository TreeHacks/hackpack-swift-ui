//
//  NetworkingView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct NetworkingView: View {
    @State var posts: [Post] = []

    var body: some View {
        List(posts, id: \.id) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
            }
        }
        .task {
            do {
                posts = try await fetchPosts()
            } catch {
                print(error)
            }
        }
    }

    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
