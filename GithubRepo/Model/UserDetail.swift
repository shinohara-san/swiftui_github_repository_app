//
//  UserDetail.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation

struct UserDetail: Codable, Identifiable {
    let id: String
    let login: String
    let name: String?
    let avatarUrl: String // avatar_url
    let followers: Int
    let following: Int
}
