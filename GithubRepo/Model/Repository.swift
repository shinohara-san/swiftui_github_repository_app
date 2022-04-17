//
//  Repository.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import Foundation

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let language: String?
    let stargazersCount: Int
    let description: String?
    let fork: Bool
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case language
        case stargazersCount = "stargazers_count"
        case description
        case fork
        case url = "html_url"
    }
}
