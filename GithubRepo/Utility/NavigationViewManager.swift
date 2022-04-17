//
//  NavigationViewManager.swift
//  GithubRepo
//
//  Created by Yuki Shinohara on 2022/04/17.
//

import UIKit

class NavigationViewManager {
    static func setUpColor() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .blue
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
