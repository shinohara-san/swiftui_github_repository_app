//
//  UserListView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct UserListView: View {

    init() {
        NavigationViewManager.setUpColor()
    }

    @StateObject private var viewModel = UserListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        UserDetailView(viewModel: UserDetailViewModel(userName: user.userName))
                    } label: {
                        UserRow(userData: User(id: user.id,
                                               userName: user.userName,
                                               avatarUrl: user.avatarUrl))
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.getUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
