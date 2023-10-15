//
//  NavigationButtonView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct NavigationButtonView<Content: View>: View {
    var label: Content
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            label
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
