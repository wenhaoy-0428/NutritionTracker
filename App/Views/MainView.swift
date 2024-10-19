//
//  StatDisplayView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/12.
//

import SwiftUI
import SwiftData



struct MainView: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: Intake.filterByToday()) private var intakes: [Intake]
    @Query private var nutrients: [Nutrient]
    @Query private var foods: [Food]
    
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
    
    let columns = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        MainTabView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(nutrients, id: \.self) { nutrient in
                        NutritionCardView(for: nutrient, intakes: intakes)
                    }
                }.padding(5)
            }.onAppear {
                initNutrient()
            }
        }
    }
}



#Preview {
    // https://developer.apple.com/videos/play/wwdc2023/10154?time=330
    //    @MainActor
    let previewContainer: ModelContainer = {
        
        var sampleIntakes = [
            Intake(food: Predefined.Foods.Apple, amount: 0.3),
            Intake(food: Predefined.Foods.Banana, amount: 0.3)
        ]
        
        do {
            let container = try ModelContainer(for: Intake.self, Nutrient.self)
            
            for intake in sampleIntakes {
                container.mainContext.insert(intake)
            }
            container.mainContext.insert(Predefined.Nutrients.Calorie)
            return container
        } catch {
            fatalError("Failed to create container")
        }
    }()
    
    MainView()
        .modelContainer(previewContainer)
}
