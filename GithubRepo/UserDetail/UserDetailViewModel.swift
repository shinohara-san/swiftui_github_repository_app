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
        APIClient.getUser(userName: userName) { userDetail in
            self.userDetail = userDetail
        }
    }

    func getRepositories() {
        APIClient.getRepositories(userName: userName) { repositories in
            self.repositories = repositories
        }
    }
}
