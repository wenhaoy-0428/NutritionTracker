//
//  PreviewData.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import Foundation
import SwiftData


@MainActor
class DataController {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Food.self, Nutrient.self, configurations: config)
            
            let protein = Nutrient(category: .protein, icon: "", information: "This is protein", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let calorie = Nutrient(category: .calorie, icon: "", information: "This is calorie", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let total_fat = Nutrient(category: .total_fat, icon: "", information: "This is total fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let trans_fat = Nutrient(category: .trans_fat, icon: "", information: "This is total fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let saturated_fat = Nutrient(category: .saturated_fat, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let cholesterol = Nutrient(category: .cholesterol, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let sodium = Nutrient(category: .sodium, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let total_carbohydrate = Nutrient(category: .total_carbohydrate, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let dietary_fiber = Nutrient(category: .dietary_fiber, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let total_sugars = Nutrient(category: .total_sugars, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let added_sugars = Nutrient(category: .added_sugars, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let vitamin_c = Nutrient(category: .vitamin_c, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let vitamin_d = Nutrient(category: .vitamin_d, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let iron = Nutrient(category: .iron, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let calcium = Nutrient(category: .calcium, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let potassium = Nutrient(category: .potassium, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
            let phosphorus = Nutrient(category: .phosphorus, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
        
        
            
            container.mainContext.insert(protein)
            container.mainContext.insert(calorie)
            container.mainContext.insert(total_fat)
            container.mainContext.insert(trans_fat)
            
            container.mainContext.insert(saturated_fat)
            container.mainContext.insert(cholesterol)
            container.mainContext.insert(sodium)
            container.mainContext.insert(total_carbohydrate)
            container.mainContext.insert(dietary_fiber)
            container.mainContext.insert(total_sugars)
            
            container.mainContext.insert(added_sugars)
            container.mainContext.insert(vitamin_c)
            container.mainContext.insert(vitamin_d)
            container.mainContext.insert(iron)
            container.mainContext.insert(calcium)
            container.mainContext.insert(potassium)
            container.mainContext.insert(phosphorus)
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
