//
//  AppApp.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/2.
//

import SwiftUI

@main
struct AppApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            WidgetItemView(title: "Tomato", icon: "\u{1F345}", category: .Grocery)
        }
    }
}
