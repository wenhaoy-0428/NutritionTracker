//
//  PreDefinitions.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/15.
//

import SwiftUI

struct Predefined {
    struct Foods {
        static var Apple: Food = Food(name: "Apple", information: "This is an apple", nutrition: [.protein:3], icon: "apple.logo", group: .fruit)
        static var Banana: Food = Food(name: "Banana", information: "This is a banana", nutrition: [.protein:2], icon: "apple.logo", group: .fruit)
        static func Cherry() -> Food {
            Food(name: "Cherry", information: "This is a cherry", nutrition: [.protein:0], icon: "apple.logo", group: .fruit)
        }
        static var foodIcons: [String] = [
            "apple.logo"
        ]
    }
    
    struct Nutrients {
        static var Protein: Nutrient = Nutrient(category: .protein, icon: "", information: "This is protein", targetIntake: 60, unit: .g, maxPerInake: 100)
        static var Calorie = Nutrient(category: .calorie, icon: "", information: "This is calorie", targetIntake: 2000, unit: .kcal, maxPerInake: 4000)
        
    }
}
