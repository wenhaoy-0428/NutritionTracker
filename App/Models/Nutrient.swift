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
    var unit: Unit
    var maxPerInake: Double
    
    init(category: NutrientCategory, icon: String, information: String, targetIntake: Double, unit: Unit, maxPerInake: Double) {
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
        case total_fat = "Total Fat"
        case saturated_fat = "Saturated Fat"
        case trans_fat = "Trans Fat"
        case cholesterol
        case sodium
        case total_carbohydrate
        case dietary_fiber
        case total_sugars
        case added_sugars
        case vitamin_c
        case vitamin_d
        case iron
        case calcium
        case potassium
        case phosphorus
    }
    
    enum Unit: String, Codable, CaseIterable {
        case g
        case mg
        case kcal
    }
}
