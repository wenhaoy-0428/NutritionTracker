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
            if !AppErrorDispatcher.shared.isActive {
                MainView()
            } else {
                Color.clear
                    .sheet(isPresented: .constant(true)) {
                        ErrorView(for: AppErrorDispatcher.shared.activeError!)
                            .interactiveDismissDisabled(true)
                    }
            }
        }.modelContainer(DataController.AppContainer)
        
    }
}
