//
//  UserDetailView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct UserDetailView: View {

    let userName: String

    @State var userDetail: UserDetail?

    var body: some View {
        VStack {
            UserInfoView(userDetail: userDetail)
                .padding()
                .onAppear {
                    APIClient.getUser(userName: userName) { userDetail in
                        self.userDetail = userDetail
                    }
                }
            Spacer()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userName: "shino")
    }
}
