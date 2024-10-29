//
//  PreviewData.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import Foundation
import SwiftData
import SwiftUI

// Reference https://www.hackingwithswift.com/quick-start/swiftdata/how-to-use-swiftdata-in-swiftui-previews
@MainActor
class DataController {
    static let AppContainer: ModelContainer = {
        
        do {
            @AppStorage("isPreloadDatainited") var isPreloadInited: Bool = false
            
            let container = try ModelContainer(for: Nutrient.self, Food.self)
            if isPreloadInited {
                return container
            }
            
            // Load Nutrients
            let nutrients = loadJSON("nutrient_preload_data", as: [Nutrient].self)
            for nutrient in nutrients {
                container.mainContext.insert(nutrient)
            }
            
            // Load Foods
            let foods = loadJSON("food_preload_data", as: [Food].self)
            for food in foods {
                container.mainContext.insert(food)
            }
            
            try container.mainContext.save()
            isPreloadInited = true
            
            return container
        } catch {
            fatalError("Failed to create model container for App: \(error.localizedDescription)")
        }
    }()
    
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Food.self, Nutrient.self, configurations: config)
                          
            
            // Load Nutrients
            let nutrients = loadJSON("nutrient_preload_data", as: [Nutrient].self)
            for nutrient in nutrients {
                container.mainContext.insert(nutrient)
            }
            
            // Load Foods
            let foods = loadJSON("food_preload_data", as: [Food].self)
            for food in foods {
                container.mainContext.insert(food)
            }
            
            try container.mainContext.save()
        
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
