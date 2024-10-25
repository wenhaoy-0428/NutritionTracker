//
//  StatDisplayView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/12.
//

import SwiftUI
import SwiftData



struct MainView: View {
    

    
//    func initNutrient() {
//        if (nutrients.isEmpty) {
//            context.insert(Predefined.Nutrients.Protein)
//            context.insert(Predefined.Nutrients.Calorie)
//        }
//        if foods.isEmpty {
//            context.insert(Predefined.Foods.Apple)
//            context.insert(Predefined.Foods.Banana)
//        }
//    }
    

    @State var tabSelection: AppTabBarItem = .home
    var body: some View {
        NavigationView {
            AppTabView(selection: $tabSelection) {
                Color.red
                    .mainTabbarItem(tab: .home, selection: tabSelection)
                
            }
        }.onAppear {
//            initNutrient()
        }
        
    }
}



#Preview {
    MainView()
        .modelContainer(DataController.previewContainer)
}
