//
//  UserListView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct UserListView: View {

    init() {
        setUpNavigationBarColor()
    }
    
    @State private var users = [UserDetail]()

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    UserRow(userData: User(id: user.nickName, name: user.name ?? "-", avatarUrl: user.avatarUrl))
                }
            }
            .listStyle(.grouped)
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            APIClient.getUsers { users in
                self.users.append(users)
            }
        }
    }

    private func setUpNavigationBarColor() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .blue
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
