//
//  PreDefinitions.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/15.
//

import SwiftUI

struct Predefined {
    struct Foods {
        static var Apple: Food = Food(name: "Apple", information: "This is an apple", nutrition: [.protein:0], icon: "apple.logo", group: .fruit)
        static var Banana: Food = Food(name: "Banana", information: "This is a banana", nutrition: [.protein:0], icon: "apple.logo", group: .fruit)
        static func Cherry() -> Food {
            Food(name: "Cherry", information: "This is a cherry", nutrition: [.protein:0], icon: "apple.logo", group: .fruit)
        }
    }
    
    struct Nutrients {
        static var Protein: Nutrient = Nutrient(category: .protein, icon: "", information: "This is protein", targetIntake: 0, unit: "mg")
        static var Calorie = Nutrient(category: .calorie, icon: "", information: "This is calorie", targetIntake: 0, unit: "Kcal")
        
    }
}
