//
//  APIService.swift
//  TestAPI
//
//  Created by Ranjan on 01/07/25.
//

import Foundation
import Combine

protocol APIService: AnyObject {
    func fetchData() -> AnyPublisher<[User], Error>
}

final class UserAPIservice: APIService {
    func fetchData() -> AnyPublisher<[User], any Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
