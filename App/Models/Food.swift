//
//  Food.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/14.
//
import SwiftData


@Model
class Food {
    var name: String
    var information: String
    var nutrition: [Nutrient.NutrientCategory: Double]
    
    init(name: String, information: String, nutrition: [Nutrient.NutrientCategory : Double]) {
        self.name = name
        self.information = information
        self.nutrition = nutrition
    }
}
