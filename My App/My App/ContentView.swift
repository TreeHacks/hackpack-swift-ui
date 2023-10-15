//
//  ContentView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .padding(50)
                    Text("Hello, world!")
                }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                    
                
                Spacer()
                
                HStack{
                    ButtonView(
                        label: Text("Tap me!"),
                        action: {
                            print("Button tapped")
                        }
                    )
                    
                    NavigationButtonView(
                        label: Text("Go to List View"),
                        destination: AnyView(ListView(items: ["Item 1", "Item 2", "Item 3"]))
                    )
                    
                    NavigationButtonView(
                        label: Text("Go to Network"),
                        destination: AnyView(NetworkingView())
                    )
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
