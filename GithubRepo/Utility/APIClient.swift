//
//  APIClient.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation
import Alamofire

class APIClient {
    static func getUsers(completion: @escaping ([User]) -> ()) {
        AF.request("https://api.github.com/users",
                   method: .get,
                   encoding: URLEncoding.default)
        .responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }

    static func getUser(userName: String, completion: @escaping (UserDetail) -> ()) {
        AF.request("https://api.github.com/users/\(userName)",
                   method: .get,
                   encoding: URLEncoding.default)
        .responseDecodable(of: UserDetail.self) { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }

    static func getRepositories(userName: String, completion: @escaping ([Repository]) -> ()) {
        AF.request("https://api.github.com/users/\(userName)/repos",
                   method: .get,
                   encoding: URLEncoding.default)
        .responseDecodable(of: [Repository].self) { response in
            switch response.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
