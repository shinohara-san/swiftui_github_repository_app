//
//  RepositoryWebView.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import SwiftUI
import WebKit

struct RepositoryWebView: UIViewRepresentable {

    let url: String
    private let observable = WebViewURLObservable()

    var observer: NSKeyValueObservation? {
        observable.instance
    }

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        observable.instance = uiView.observe(\WKWebView.url, options: .new) { view, change in
            if let url = view.url {
                print("Page URL: \(url)")
            }
        }
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

private class WebViewURLObservable: ObservableObject {
    @Published var instance: NSKeyValueObservation?
}
