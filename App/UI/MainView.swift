//
//  StatDisplayView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/12.
//

import SwiftUI
import SwiftData


struct MainView: View {
    @Environment(\.modelContext) var context
    @Environment(AppErrorDispatcher.self) var G_AppErrorDispatcher

    @Query var nutrients: [Nutrient]
    @Query var foods: [Food]
    
    func initNutrient() {
        if (nutrients.isEmpty) {
            context.insert(Predefined.Nutrients.Protein)
            context.insert(Predefined.Nutrients.Calorie)
        }
        if foods.isEmpty {
            context.insert(Predefined.Foods.Apple)
            context.insert(Predefined.Foods.Banana)
        }
    }
    
    enum AppTabBarItem{
        case main, misc
    }

    @State var tab: AppTabBarItem = .main
    var body: some View {
        // Create a bindable
        @Bindable var appErrorDispatcher = G_AppErrorDispatcher
        NavigationStack {
            AppTabView(selection: $tab) {
                // Nutrition Main View
                AppTab(value: AppTabBarItem.main) {
                    NutritionMainView()
                } label: {
                    MainTabBarItem()
                }

                AppTab(value: AppTabBarItem.misc) {
                    MiscMenuView()
                } label: {
                    MiscTabBarItem()
                }
            }
        }.onAppear {
            initNutrient()
        }.sheet(item: $appErrorDispatcher.activeError, onDismiss: appErrorDispatcher.clearError) { apperror in
            ErrorView(for: apperror)
        }
    }
}



#Preview {
    MainView()
        .appPreviewSetUp()
}
