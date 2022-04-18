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
        APIClient.getUsers { users in
            self.users.append(contentsOf: users)
        }
    }
}
