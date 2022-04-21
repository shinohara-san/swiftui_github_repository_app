//
//  UserDetailViewModel.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/18.
//

import Foundation
import SwiftUI

final class UserDetailViewModel: ObservableObject {

    let userName: String
    @Published var userDetail: UserDetail? = nil
    @Published var repositories: [Repository] = []

    init(userName: String){
        self.userName = userName
    }

    func getUser() {
        let client = GitHubClient(httpClient: URLSession.shared)
        let request = GitHubAPI.GetUser(userName: userName)

        client.send(request: request) { result in
            switch result {
            case .success(let userDetail):
                DispatchQueue.main.async {
                    self.userDetail = userDetail
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    func getRepositories() {
        let client = GitHubClient(httpClient: URLSession.shared)
        let request = GitHubAPI.GetRepositories(userName: userName)

        client.send(request: request) { result in
            switch result {
            case .success(let repositories):
                DispatchQueue.main.async {
                    self.repositories = repositories
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
