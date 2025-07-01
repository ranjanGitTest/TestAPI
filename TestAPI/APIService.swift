//
//  APIService.swift
//  TestAPI
//
//  Created by Ranjan on 01/07/25.
//

import Foundation
import Combine

protocol APIService {
    associatedtype T
    func fetchData() -> AnyPublisher<[T], Error>
}

final class UserAPIservice: APIService {
    typealias user = User
    func fetchData() -> AnyPublisher<[user], Error> {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https://"
        urlComponent.host = "jsonplaceholder.typicode.com"
        urlComponent.path = "/users"
    
         let url = urlComponent.url
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            
            // Optional: add headers
            request.setValue("application/json", forHTTPHeaderField: "Accept")

        return URLSession.shared.dataTaskPublisher(for: request.url!)
            .map(\.data)
            .decode(type: [user].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
