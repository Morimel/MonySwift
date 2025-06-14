//
//  MonySwiftApp.swift
//  MonySwift
//
//  Created by Isa Melsov on 5/6/25.
//

import SwiftUI

@main
struct MonySwiftApp: App {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightBlue

        UITabBar.appearance().standardAppearance = appearance

        // Для iOS 15+ — чтобы фон был при скролле
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
