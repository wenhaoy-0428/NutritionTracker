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
    

    @State var tabSelection: AppTabBarItem = .main
    var body: some View {
        NavigationView {
            AppTabView(selection: $tabSelection) {
                // Nutrition Main View
                NutritionMainView()
                    .appTabBarItem(tab: .main, selection: tabSelection)
                
                // Misc View
                MiscMenuView()
                    .appTabBarItem(tab: .misc, selection: tabSelection)
            }
        }.onAppear {
            initNutrient()
        }
        
    }
}



#Preview {
    MainView()
        .modelContainer(DataController.previewContainer)
}
