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
    
    private var anyCancelable: Set<AnyCancellable>?
    
    
    func loadData() {
        
    }
    
}
