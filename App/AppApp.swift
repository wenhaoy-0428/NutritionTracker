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
    
    @State var G_AppErrorDispatcher = AppErrorDispatcher.shared
    
    var body: some Scene {
        WindowGroup {
            @Bindable var appErrorDispatcher = G_AppErrorDispatcher
            MainView()
                .modelContainer(for: [Intake.self, Nutrient.self, Food.self])
                .sheet(item: $appErrorDispatcher.activeError) { apperror in
                    ErrorView(for: apperror)
                }
        }
    }
}
