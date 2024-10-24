//
//  FoodNutritionFactView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/23.
//

import SwiftUI
import SwiftData

struct FoodNutritionFactView: View {
    
    let food: Food
    @Query var nutrients: [Nutrient]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Nutrition Fact")
                .font(.system(size: 50))
                .bold()
            divider(.medium)
            
            Text("Serving Size")
            Text("100 grams (100g)")
            
            divider(.large)
            
            HStack {
                Text("Calories")
                Spacer()
                if let calorie = food.nutrition[.calorie] {
                    Text(String(format: "%.0f", calorie))
                }
            }
            .font(.system(size: 40))
            .bold()
            .padding(Edge.Set([.vertical]), 4)
            divider(.medium)
            
            HStack {
                Spacer()
                Text("% Daily Value *")
            }.bold()
            
            // total fat
            rowView(for: .total_fat, value: food.nutrition[.total_fat], isBold: true)
            divider(.slim)
            
            // saturated fat
            rowView(for: .saturated_fat, value: food.nutrition[.saturated_fat], isBold: false)
                .padding(.leading)
            divider(.slim)

            // trans fat
            rowView(for: .trans_fat, value: food.nutrition[.saturated_fat], isBold: false)
                .padding(.leading)
            divider(.slim)
            
            // cholesterol
            rowView(for: .cholesterol, value: food.nutrition[.cholesterol], isBold: true)
            divider(.slim)
            
            // sodium
            rowView(for: .sodium, value: food.nutrition[.sodium], isBold: true)
            divider(.slim)
            
            // total carbohydrate
            rowView(for: .total_carbohydrate, value: food.nutrition[.total_carbohydrate], isBold: true)
            divider(.slim)
            
            // dietary fiber
            rowView(for: .dietary_fiber, value: food.nutrition[.dietary_fiber], isBold: false)
                .padding(.leading)
            divider(.slim)
            
            // total sugers
            rowView(for: .total_sugars, value: food.nutrition[.total_sugars], isBold: false)
                .padding(.leading)
                .padding(.leading)
            divider(.slim)
                .padding(.leading)
                .padding(.leading)
                .padding(.leading)
            
            // added sugars
            rowView(for: .added_sugars, value: food.nutrition[.added_sugars], isBold: false)
                .padding(.leading)
                .padding(.leading)
                .padding(.leading)
            divider(.slim)
            
            // protein
            rowView(for: .protein, value: food.nutrition[.protein], isBold: true)
            divider(.large)
            
            // vita c
            rowView(for: .vitamin_c, value: food.nutrition[.vitamin_c], isBold: true)
            divider(.slim)
            
            // vita d
            rowView(for: .vitamin_d, value: food.nutrition[.vitamin_d], isBold: true)
            divider(.slim)
            
            // iron
            rowView(for: .iron, value: food.nutrition[.iron], isBold: true)
            divider(.slim)
            
            // calcium
            rowView(for: .calcium, value: food.nutrition[.calcium], isBold: true)
            divider(.slim)
            
            // potassium
            rowView(for: .potassium, value: food.nutrition[.potassium], isBold: true)
            divider(.slim)
            
            // phosphorus
            rowView(for: .phosphorus, value: food.nutrition[.phosphorus], isBold: true)
            divider(.bold)
            
            Text("*The % Daily Value (DV) tells you how much a nutrient in a serving of food contributes to a daily diet. It is calculated based on your personal preference.")
                .font(.caption)
        }
        .padding(Edge.Set([.horizontal]), 12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    func rowView(for category: Nutrient.NutrientCategory, value: Double?, isBold: Bool?) -> some View {
        
        let nutrient = nutrients.filter { $0.category == category }[0]
        
        return HStack {
            if category == .trans_fat {
                Text("Trans")
                    .italic()
                Text("Fat")
            } else if category == .added_sugars {
                Text("Includes")
            } else {
                Text(category.rawValue.capitalized)
                    .fontWeight((isBold ?? false) ? .heavy : .medium)
            }
            
            if let value = value {
                Text("\(String(format: "%.1f", value))\(nutrient.unit.rawValue)")
            } else {
                Text("--\(nutrient.unit.rawValue)")
            }
            
            if category == .added_sugars {
                Text("Added Sugars")
            }

            Spacer()
            Text("\("--")%")
                .font(.headline)
                .fontWeight(.heavy)
        }
    }
    enum DividerSize {
        case slim
        case medium
        case bold
        case large
    }
    
    func divider(_ size: DividerSize) -> some View { // Use 'some View' for a SwiftUI view return type
        switch size {
        case .slim: // Add dot prefix to enum cases
            return Rectangle()
                .frame(height: 2) // Specify width parameter
        case .medium:
            return Rectangle()
                .frame(height: 3)
        case .bold:
            return Rectangle()
                .frame(height: 5)
        case .large:
            return Rectangle()
                .frame(height: 10)
        }
    }
}

#Preview {
    let food = Food(name: "Apple", information: "This is an apple", nutrition: [.calorie:10], icon: "", group: .fruit)
    FoodNutritionFactView(food: food)
        .modelContainer(DataController.previewContainer)
}
