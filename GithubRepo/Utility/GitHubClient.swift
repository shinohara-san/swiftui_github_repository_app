//
//  GitHubClient.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/21.
//

import Foundation

public class GitHubClient {
    private let httpClient: HTTPClient

    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    public func send<Request : GitHubRequest>(request: Request,
                                              completion: @escaping (Result<Request.Response, Error>) -> Void) {
        let urlRequest = request.buildURLRequest()
        httpClient.sendRequest(urlRequest) { result in
            switch result {
            case .success((let data, let urlResponse)):
                do {
                    let response = try request.response(from: data, urlResponse: urlResponse)
                    completion(.success(response))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
