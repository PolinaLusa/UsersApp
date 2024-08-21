//
//  MyPost.swift
//  UsersApp
//
//  Created by Полина Лущевская on 6.05.24.
//

import Foundation
struct MyPost: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    var isExpanded = false
    
    private enum CodingKeys: String, CodingKey {
           case id
           case userId
           case title
           case body
          }
}
