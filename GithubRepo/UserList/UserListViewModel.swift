//
//  UserListViewModel.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/18.
//

import Foundation

final class UserListViewModel: ObservableObject {
    @Published var users = [User]()

    func getUsers() {
        let client = GitHubClient(httpClient: URLSession.shared)
        let request = GitHubAPI.GetUsers()

        client.send(request: request) { result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
