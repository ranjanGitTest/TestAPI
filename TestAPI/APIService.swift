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
        let session: URLSession = {
            // issue URLSession is broken in iOS 18.4 RC Simulator
            // https://developer.apple.com/forums/thread/777999
            return URLSession(configuration: .ephemeral)
        }()
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
