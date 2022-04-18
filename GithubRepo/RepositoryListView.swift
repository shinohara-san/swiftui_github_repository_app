//
//  RepositoryListView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI

struct RepositoryListView: View {

    let repositories: [Repository]?
    @State private var showingSheet = false

    var body: some View {
        List {
            ForEach(repositories?.filter { !$0.fork } ?? [Repository]() ) { repo in
                Button {
                    self.showingSheet.toggle()
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "magazine.fill")
                                .foregroundColor(Color.pink)
                            Text(repo.name)
                        }
                        if let language = repo.language {
                            Text(language)
                        }
                        Text("\(repo.stargazersCount)")
                        if let description = repo.description {
                            Text(description)
                        }
                    }
                }
                .foregroundColor(.black)
                .sheet(isPresented: $showingSheet) {
                    NavigationView {
                        RepositoryWebView(url: repo.url)
                            .navigationBarTitle(Text(repo.name),
                                                displayMode: .inline)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    Button("閉じる") {
                                        showingSheet.toggle()
                                    }
                                    .foregroundColor(Color.white)
                                }
                            }
                    }
                }
            }
        }
        .listStyle(.grouped)
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(repositories: nil)
    }
}
