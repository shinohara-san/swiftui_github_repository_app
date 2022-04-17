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
}
