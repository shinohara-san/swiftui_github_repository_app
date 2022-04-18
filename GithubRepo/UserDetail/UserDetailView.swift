//
//  UserDetailView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct UserDetailView: View {

    @StateObject var viewModel: UserDetailViewModel

    var body: some View {
        VStack {
            UserInfoView(userDetail: viewModel.userDetail)
                .padding()
            RepositoryListView(repositories: viewModel.repositories)
        }
        .onAppear {
            viewModel.getUser()
            viewModel.getRepositories()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(viewModel: UserDetailViewModel(userName: "shinohara-san"))
    }
}
