//
//  ListView.swift
//  My App
//
//  Created by Irfan Nafi on 10/15/23.
//

import SwiftUI

struct ListView: View {
    var items: [String]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}
