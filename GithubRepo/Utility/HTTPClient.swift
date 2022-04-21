//
//  HTTPClient.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/21.
//

import Foundation

public protocol HTTPClient {
    func sendRequest(_ urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}

extension URLSession: HTTPClient {
    public func sendRequest(_ urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            switch (data, response, error) {
            case (_, _, let error?):
                completion(.failure(error))
            case (let data?, let response as HTTPURLResponse, _):
                completion(.success((data, response)))
            default:
                fatalError("invalid response")
            }
        }
        task.resume()
    }
}
