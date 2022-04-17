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

    var body: some View {
        NavigationView {
            List {
                UserRow(userData: User(id: "1", name: "shino", avatarUrl: ""))
                UserRow(userData: User(id: "2", name: "shino", avatarUrl: ""))
                UserRow(userData: User(id: "3", name: "shino", avatarUrl: ""))
                UserRow(userData: User(id: "4", name: "shino", avatarUrl: ""))
            }
            .listStyle(.grouped)
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.inline)
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
