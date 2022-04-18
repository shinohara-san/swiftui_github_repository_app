//
//  RepositoryListView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct RepositoryListView: View {

    let repositories: [Repository]?

    var body: some View {
        List {
            ForEach(repositories?.filter { !$0.fork } ?? [Repository]()) { repo in
                NavigationLink {
                    RepositoryWebView(url: repo.url)
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(repo.name)
                        if let language = repo.language {
                            Text(language)
                        }
                        Text("\(repo.stargazersCount)")
                        if let description = repo.description {
                            Text(description)
                        }
                    }
                }
            }
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(repositories: nil)
    }
}
