//
//  NutritionModel.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/12.
//
import SwiftData

@Model
class Nutrient: Decodable {
    var category: NutrientCategory
    var icon: String
//    var information: [InfoText]
    var targetIntake: Double
    var maxIntake: Double {
        targetIntake * 1.15
    }
    var minIntake: Double {
        targetIntake * 0.85
    }
    var unit: Unit
    var maxPerIntake: Double
    
    init(category: NutrientCategory, icon: String, information: [String], targetIntake: Double, unit: Unit, maxPerInake: Double) {
        self.category = category
        self.icon = icon
//        self.information = information
        self.targetIntake = targetIntake
        self.unit = unit
        self.maxPerIntake = maxPerInake
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decode(NutrientCategory.self, forKey: .category)
        icon = try values.decode(String.self, forKey: .icon)
//        information = try values.decode(Array<String>.self, forKey: .information)
        targetIntake = try values.decode(Double.self, forKey: .targetIntake)
        unit = try values.decode(Unit.self, forKey: .unit)
        maxPerIntake = try values.decode(Double.self, forKey: .maxPerIntake)
    }
    
    enum CodingKeys: String, CodingKey {
        case category
        case icon
        case information
        case targetIntake
        case unit
        case maxPerIntake
     }
}

// https://stackoverflow.com/questions/44725202/swift-4-decodable-dictionary-with-enum-as-key
extension Nutrient {
    enum NutrientCategory: String, CaseIterable, Codable, CodingKeyRepresentable {
        case calorie = "calorie"
        case protein
        case total_carbohydrate = "total carbohydrate"
        case total_fat = "total fat"
        case total_sugars = "total sugars"
        case added_sugars = "added sugars"
        case saturated_fat = "saturated fat"
        case trans_fat = "trans fat"
        case cholesterol
        case sodium
        case calcium
        case dietary_fibre = "dietary fibre"
        case vitamin_c = "vitamin c"
        case vitamin_d = "vitamin d"
        case iron
        case potassium
        case phosphorus
    }
    
    enum Unit: String, Codable, CaseIterable {
        case g
        case mg
        case kcal
    }
}
