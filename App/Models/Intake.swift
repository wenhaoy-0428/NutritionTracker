//
//  IntakeModel.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/12.
//
import SwiftUI
import SwiftData

@Model
class Intake {
    var timestamp: Date
    var food: Food
    var amount: Double
    
    init(food: Food, amount: Double) {
        self.timestamp = Date()
        self.food = food
        self.amount = amount
    }
}

extension Intake {
    static func filterByToday() -> Predicate<Intake> {
        let calendar = Calendar.autoupdatingCurrent
        let start = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) ?? Date()
        let end = calendar.date(byAdding: .init(day: 1), to: start) ?? start
        return #Predicate<Intake> { intake in
            intake.timestamp >= start && intake.timestamp < end
          }
    }
    
    func getNutrition(for nutrientCategory: Nutrient.NutrientCategory) -> Double {
        return self.amount * (self.food.nutrition[nutrientCategory] ?? 0)
    }
}
