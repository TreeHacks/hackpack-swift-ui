//
//  ButtonView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct ButtonView: View {
    var label: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Text(label)
        }
    }
}
