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
    
//    let nutritions: [NutrientSummary] = [
//        NutrientSummary(kind: "Calorie", icon: "🔥", description: "", targetIntake: 2400, currentIntake: 300, unit: "KCAL"),
//        NutrientSummary(kind: "Protein", icon: "🍳", description: "", targetIntake: 2400, currentIntake: 300, unit: "g"),
//    ]
//
    
    
    let columns = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(nutrients, id: \.self) { nutrient in
                    NutritionCardView(for: nutrient, intakes: intakes)
                }
                ForEach(foods, id: \.self) { food in
                    Text(food.name)
                }
            }.padding(5)
            
            Button {
                context.insert(Nutrient(category: .protein, icon: "", information: "", targetIntake: 2400, unit: "mg"))
                let f = Food(name: "Apple", information: "", nutrition: [.protein: 0.3])
                context.insert(f)
                context.insert(Intake(timestamp: Date(), food: f, amount: 0.3))
            } label: {
                Text("Add")
            }
        }
    }
}

// https://developer.apple.com/videos/play/wwdc2023/10154?time=330
@MainActor
let previewContainer: ModelContainer = {
    
    var sampleIntakes = [
        Intake(timestamp: Date(), food: Food(name: "Apple", information: "", nutrition: [:]), amount: 0.3),
        Intake( timestamp: Date(), food: Food(name: "Banana", information: "", nutrition: [:]), amount: 0.3)
    ]
    
    do {
        let container = try ModelContainer(for: Intake.self, Nutrient.self)
        
        for intake in sampleIntakes {
            container.mainContext.insert(intake)
        }
        container.mainContext.insert(Nutrient(category: .protein, icon: "", information: "", targetIntake: 2400, unit: "mg"))
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

#Preview {
    MainView()
        .modelContainer(previewContainer)
}
