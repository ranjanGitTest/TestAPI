//
//  ModelUser.swift
//  TestAPI
//
//  Created by Ranjan on 01/07/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
}
