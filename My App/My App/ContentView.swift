//
//  ContentView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                ButtonView(label: "Tap me!")
                NavigationLink(destination: ListView(items: ["Item 1", "Item 2", "Item 3"])) {
                    Text("Go to list")
                }
                NavigationLink(destination: NetworkingView()) {
                    Text("Go to networking")
                }
                Spacer()
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }

                ZStack {
                    Circle().fill(Color.blue)
                    Text("Hello, world!")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
