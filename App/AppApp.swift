//
//  AppApp.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/2.
//

import SwiftUI
import SwiftData

@main
struct AppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Intake.self, Nutrient.self, Food.self])
        }
    }
}
