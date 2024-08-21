//
//  ApiSevice.swift
//  UsersApp
//
//  Created by Полина Лущевская on 6.05.24.
//
import Alamofire
import Combine

class ApiService {
  static let BASE_URL = "https://jsonplaceholder.typicode.com/"
    
    func getPosts() -> AnyPublisher<[MyPost], AFError> {
        
    let publisher = AF.request(ApiService.BASE_URL + "posts", method: .get)
            .publishDecodable(type: [MyPost].self)

        return publisher.value()
    }
    
    func getComments() -> AnyPublisher<[MyComment], AFError> {
        
    let publisher = AF.request(ApiService.BASE_URL + "comments", method: .get)
            .publishDecodable(type: [MyComment].self)

        return publisher.value()
    }
    
    
}
