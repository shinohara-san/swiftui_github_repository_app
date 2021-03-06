//
//  User.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let userName: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case userName = "login"
        case avatarUrl = "avatar_url"
    }
}
