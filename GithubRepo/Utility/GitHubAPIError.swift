//
//  GitHubAPIError.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/21.
//

import Foundation

public struct GitHubAPIError: Codable, Error {
    public struct Error: Codable {
        public var resource: String
        public var field: String
        public var code: String
    }
    
    public var message: String
    public var errors: [Error]
}
