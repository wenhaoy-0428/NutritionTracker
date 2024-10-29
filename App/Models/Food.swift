//
//  Food.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/14.
//
import SwiftData


@Model
class Food: Decodable {
    @Attribute(.unique) var name: String
//    var information: [String]
    var nutrition: Dictionary<Nutrient.NutrientCategory, Double>
    var isFavorite: Bool = false
    var group: Group
    // in gram
    var isPredefined: Bool = false
    var imgString: String?
    
    init(name: String, information: String, nutrition: [Nutrient.NutrientCategory : Double], isFavorite: Bool? = false, icon: String, group: Group) {
        self.name = name
//        self.information = information
        self.nutrition = nutrition
        if let isFavorite = isFavorite {
            self.isFavorite = isFavorite
        }
        self.group = group
    }
    
    required init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        imgString = try values.decode(String.self, forKey: .imgString)
        nutrition = try values.decode(Dictionary<Nutrient.NutrientCategory, Double>.self, forKey: .nutrition)
        isPredefined = true
        group = try values.decode(Group.self, forKey: .group)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case nutrition
        case imgString
        case group
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
    
    var icon: String {
        switch self.group {
        case .meat:
            return "meat-icon-food-group-"
        case .fruit:
            return "fruit-icon-food-group"
        case .dairy:
            return "dairy-icon-food-group"
        case .drink:
            return "drink-icon-food-group"
        case .meal:
            return "meal-icon-food-group"
        case .protein:
            return "protein-icon-food-group"
        case .starch:
            return "starch-icon-food-group"
        case .vagetable:
            return "veggie-icon-food-group"
        }
    }
}
