//
//  PreviewData.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import Foundation
import SwiftData

// Reference https://www.hackingwithswift.com/quick-start/swiftdata/how-to-use-swiftdata-in-swiftui-previews
@MainActor
class DataController {
    static let AppContainer: ModelContainer = {
        
        do {
            let container = try ModelContainer(for: Nutrient.self)
            
            // Load Nutrients
            let nutrients = loadJSON("nutrient_preload_data", as: [Nutrient].self)
            for nutrient in nutrients {
                container.mainContext.insert(nutrient)
            }
            
            // Load Foods
            
            
            try container.mainContext.save()
            return container
        } catch {
            fatalError("Failed to create model container for App: \(error.localizedDescription)")
        }
    }()
    
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Food.self, Nutrient.self, configurations: config)
                          
//            let protein = Nutrient(category: .protein, icon: "", information: "This is protein", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let calorie = Nutrient(category: .calorie, icon: "", information: "This is calorie", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let total_fat = Nutrient(category: .total_fat, icon: "", information: "This is total fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let trans_fat = Nutrient(category: .trans_fat, icon: "", information: "This is total fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let saturated_fat = Nutrient(category: .saturated_fat, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let cholesterol = Nutrient(category: .cholesterol, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let sodium = Nutrient(category: .sodium, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let total_carbohydrate = Nutrient(category: .total_carbohydrate, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let dietary_fiber = Nutrient(category: .dietary_fiber, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let total_sugars = Nutrient(category: .total_sugars, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let added_sugars = Nutrient(category: .added_sugars, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let vitamin_c = Nutrient(category: .vitamin_c, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let vitamin_d = Nutrient(category: .vitamin_d, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let iron = Nutrient(category: .iron, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let calcium = Nutrient(category: .calcium, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let potassium = Nutrient(category: .potassium, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//            let phosphorus = Nutrient(category: .phosphorus, icon: "", information: "This is saturated fat", targetIntake: 2400, unit: .g, maxPerInake: 100)
//        
//        
//            
//            container.mainContext.insert(protein)
//            container.mainContext.insert(calorie)
//            container.mainContext.insert(total_fat)
//            container.mainContext.insert(trans_fat)
//            
//            container.mainContext.insert(saturated_fat)
//            container.mainContext.insert(cholesterol)
//            container.mainContext.insert(sodium)
//            container.mainContext.insert(total_carbohydrate)
//            container.mainContext.insert(dietary_fiber)
//            container.mainContext.insert(total_sugars)
//            
//            container.mainContext.insert(added_sugars)
//            container.mainContext.insert(vitamin_c)
//            container.mainContext.insert(vitamin_d)
//            container.mainContext.insert(iron)
//            container.mainContext.insert(calcium)
//            container.mainContext.insert(potassium)
//            container.mainContext.insert(phosphorus)
//            
//            
//            // Foods
//            var apple: Food = Food(name: "Apple", information: "This is an apple", nutrition: [.protein:3], icon: "apple.logo", group: .fruit)
//            var banana: Food = Food(name: "Banana", information: "This is a banana", nutrition: [.protein:2], icon: "apple.logo", group: .fruit)
//            
//            container.mainContext.insert(apple)
//            container.mainContext.insert(banana)
            
            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
    
    static func loadJSON<T: Decodable>(_ filename: String, as type: T.Type) -> T {
        let data: Data

        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: fileURL)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

}
