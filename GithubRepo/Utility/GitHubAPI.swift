//
//  GitHubAPI.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/21.
//

import Foundation

public final class GitHubAPI {

    struct GetUsers: GitHubRequest {
        public typealias Response = [User]
        public var path: String = "users"
    }

    struct GetUser: GitHubRequest {
        let userName: String
        public typealias Response = UserDetail
        public var path: String {
            return "users/\(userName)"
        }
    }

    struct GetRepositories: GitHubRequest {
        let userName: String
        typealias Response = [Repository]
        public var path: String {
            return "users/\(userName)/repos"
        }
    }
}
