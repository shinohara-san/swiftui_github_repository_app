//
//  RepositoryRow.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/21.
//

import SwiftUI

struct RepositoryRow: View {

    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "magazine.fill")
                    .foregroundColor(Color.pink)
                Text(repository.name)
            }
            if let language = repository.language {
                HStack {
                    Image(systemName: "square.grid.2x2.fill")
                        .foregroundColor(Color.green)
                    Text("Language: \(language)")
                }
            }
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                Text(String(repository.stargazersCount))
            }
            if let description = repository.description {
                VStack {
                    Text("---Description---")
                    Text(description)
                }
                .multilineTextAlignment(.center)
            }
        }
    }
}

struct RepositoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRow(repository: Repository(id: 1,
                                             name: "example",
                                             language: "Swift",
                                             stargazersCount: 10,
                                             description: nil,
                                             fork: false,
                                             url: ""))
    }
}
