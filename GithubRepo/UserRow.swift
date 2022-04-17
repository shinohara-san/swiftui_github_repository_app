//
//  UserRow.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserRow: View {

    var userData: User

    var body: some View {
        HStack {
            WebImage(url: URL(string: userData.avatarUrl))
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 64, height: 64, alignment: .center)

            Text(userData.name)
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(userData: User(id: 1, name: "shino", avatarUrl: "https://avatars.githubusercontent.com/u/56948513?v=4"))
    }
}
