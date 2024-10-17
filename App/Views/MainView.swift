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
    
    @State var showSheet: Bool = false
    
    func initNutrient() {
        if (nutrients.isEmpty) {
            context.insert(Nutrient(category: .protein, icon: "", information: "", targetIntake: 2400, unit: "mg"))
            context.insert(Nutrient(category: .calorie, icon: "", information: "", targetIntake: 2400, unit: "mg"))
        }
        if foods.isEmpty {
            context.insert(Predefined.Foods.Apple)
            context.insert(Predefined.Foods.Banana)
        }
    }
    
    let columns = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(nutrients, id: \.self) { nutrient in
                    NutritionCardView(for: nutrient, intakes: intakes)
                }
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Add")
                }

            }.padding(5)
                .sheet(isPresented: $showSheet) {
                    IntakeInsertView()
                }
        }.onAppear {
            initNutrient()
        }
        
    }
}



#Preview {
    // https://developer.apple.com/videos/play/wwdc2023/10154?time=330
//    @MainActor
    let previewContainer: ModelContainer = {
        
        var sampleIntakes = [
            Intake(timestamp: Date(), food: Predefined.Foods.Apple, amount: 0.3),
            Intake( timestamp: Date(), food: Predefined.Foods.Banana, amount: 0.3)
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
    
    MainView()
        .modelContainer(previewContainer)
}
