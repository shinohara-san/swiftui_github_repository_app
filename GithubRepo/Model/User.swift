//
//  User.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let avatarUrl: String
}
