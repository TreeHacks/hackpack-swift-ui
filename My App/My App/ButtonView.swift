//
//  ButtonView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct ButtonView: View {
    var label: String

    var body: some View {
        Button(action: {
            print("Button tapped")
        }, label: {
            Text(label)
        })
    }
}
