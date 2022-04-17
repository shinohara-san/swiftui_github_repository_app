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

    @State private var users = [User]()

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailView()
                    } label: {
                        UserRow(userData: User(id: user.id,
                                               name: user.name,
                                               avatarUrl: user.avatarUrl))
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            APIClient.getUsers { users in
                self.users.append(contentsOf: users)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
