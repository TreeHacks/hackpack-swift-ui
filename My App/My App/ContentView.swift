//
//  ContentView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            ButtonView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
