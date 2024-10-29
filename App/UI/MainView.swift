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
    @Query var nutrients: [Nutrient]
    @Query var foods: [Food]
    
    enum AppTabBarItem{
        case main, misc
    }

    @State var tab: AppTabBarItem = .main
    var body: some View {
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
        }
    }
}



#Preview {
    MainView()
        .appPreviewSetUp()
}
