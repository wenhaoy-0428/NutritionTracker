//
//  NutritionModel.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/12.
//
import SwiftData

@Model
class Nutrient {
    var category: NutrientCategory
    var icon: String
    var information: String
    var targetIntake: Double
    var maxIntake: Double {
        targetIntake * 1.15
    }
    var minIntake: Double {
        targetIntake * 0.85
    }
    var unit: String
    var maxPerInake: Double
    
    init(category: NutrientCategory, icon: String, information: String, targetIntake: Double, unit: String, maxPerInake: Double) {
        self.category = category
        self.icon = icon
        self.information = information
        self.targetIntake = targetIntake
        self.unit = unit
        self.maxPerInake = maxPerInake
    }
}

extension Nutrient {
    enum NutrientCategory: String, CaseIterable, Codable {
        case calorie
        case protein
    }
}
