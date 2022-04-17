//
//  UserRow.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct UserRow: View {

    var userData: User

    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(width: 64, height: 64)
            Text(userData.name)
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(userData: User(id: "1", name: "shino", avatarUrl: "https://avatars.githubusercontent.com/u/56948513?v=4"))
    }
}
