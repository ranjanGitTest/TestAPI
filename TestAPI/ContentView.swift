//
//  ContentView.swift
//  TestAPI
//
//  Created by Ranjan on 01/07/25.
//

import SwiftUI

struct ContentView: View {
    
  @ObservedObject var viewModel = UserViewModel(apiService: UserAPIservice())
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: DetailsContentView(name: user.name)) {
                    Text(user.name)

                }
            }
            .navigationTitle("User List")
            .onAppear {
                viewModel.loadData()
            }
        }

    }
}

#Preview {
    ContentView()
}
