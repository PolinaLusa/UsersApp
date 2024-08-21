//
//  MyComment.swift
//  UsersApp
//
//  Created by Полина Лущевская on 6.05.24.
//

import Foundation
struct MyComment: Codable{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
