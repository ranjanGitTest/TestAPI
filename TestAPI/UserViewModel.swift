//
//  UserViewModel.swift
//  TestAPI
//
//  Created by Ranjan on 01/07/25.
//

import Foundation
import Combine


class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    
    private var cancelable = Set<AnyCancellable>()
    
    var apiService: APIService
    init( apiService: APIService) {
        self.apiService = apiService
    }
    
    func loadData() {
        apiService.fetchData()
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] user in
                self?.users = user
            }
            .store(in: &cancelable)

    }
    
}
