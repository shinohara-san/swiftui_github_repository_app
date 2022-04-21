//
//  UserDetail.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation

struct UserDetail: Codable, Identifiable {
    let id: Int
    let userName: String
    let fullName: String?
    let avatarUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "login"
        case fullName
        case avatarUrl = "avatar_url"
        case followers
        case following
    }
}
