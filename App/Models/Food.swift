//
//  Food.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/14.
//
import SwiftData


@Model
class Food {
    @Attribute(.unique) var name: String
    var information: String
    var nutrition: [Nutrient.NutrientCategory: Double]
    var isFavorite: Bool = false
    var icon: String
    var group: Group
    
    init(name: String, information: String, nutrition: [Nutrient.NutrientCategory : Double], isFavorite: Bool? = false, icon: String, group: Group) {
        self.name = name
        self.information = information
        self.nutrition = nutrition
        if let isFavorite = isFavorite {
            self.isFavorite = isFavorite
        }
        self.icon = icon
        self.group = group
    }
}

extension Food {
    enum Group: String, Codable, CaseIterable {
        case meat
        case fruit
        case vagetable
        case dairy
        case starch
        case protein
        case meal
        case drink
    }
}
