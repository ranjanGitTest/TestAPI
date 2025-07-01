//
//  DetailsContentView.swift
//  TestAPI
//
//  Created by Ranjan on 01/07/25.
//
import SwiftUI

struct DetailsContentView: View {
    var name: String
    var body: some View {
        Text("\(name)")
    }
}

#Preview {
    DetailsContentView(name: "Hi")
}
