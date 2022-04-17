//
//  APIClient.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation
import Alamofire

class APIClient {
    static func getUsers(completion: @escaping (UserDetail) -> ()) {
        AF.request("https://api.github.com/users/shinohara-san",
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
}
