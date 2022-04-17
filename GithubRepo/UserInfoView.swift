//
//  UserInfoView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserInfoView: View {

    var userDetail: UserDetail?

    var body: some View {
        HStack {
            WebImage(url: URL(string: userDetail?.avatarUrl ?? ""))
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 160, height: 160, alignment: .center)

            VStack(alignment: .leading, spacing: 10) {
                Text("ユーザー名: \(userDetail?.userName ?? "")")
                if let fullName = userDetail?.fullName {
                    Text("フルネーム: \(fullName)")
                }
                Text("フォロワー数: \(userDetail?.followers ?? 0)")
                Text("フォロイー数: \(userDetail?.following ?? 0)")
            }
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(userDetail: UserDetail(id: 1,
                                            userName: "shino",
                                            fullName: "shinohara yuki",
                                            avatarUrl: "https://i.gzn.jp/img/2018/01/15/google-gorilla-ban/00.jpg",
                                            followers: 100,
                                            following: 100))
    }
}
