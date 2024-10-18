//
//  FoodUpdateView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/17.
//

import SwiftUI

struct FoodUpdateView: View {
    var food: Food?
    
    @State var foodName: String = ""
    @State var foodGroup: Food.Group = .meal
    @State var foodNutrition: [Nutrient.NutrientCategory:Double] = [:]
    
    @State var protein: Double?
    @State var calorie: Double?
    @State var isFavorite: Bool = false
    @Environment(\.modelContext) var context
    
    @Environment(\.dismiss) private var dismiss
    
    init() {}
    
    init(for food: Food) {
        self.food = food
    }
    
    var validated: Bool {
        if (foodName.isEmpty) {
            return false
        }
        
        if let protein = protein  {
            if  protein > Predefined.Nutrients.Protein.maxPerInake {
                return false
            }
        }
        
        if let calorie = calorie  {
            if  calorie > Predefined.Nutrients.Calorie.maxPerInake  {
                return false
            }
        }
        
        return true
    }
    
    @State private var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    
    
    var body: some View {
        Form {
            Section {
                TextField("Food", text: $foodName)
                
                Picker("Group", selection: $foodGroup) {
                    ForEach(Food.Group.allCases, id: \.self) { group in
                        Text("\(group.rawValue.capitalized)").tag(group)
                    }
                }
                
                Toggle(isOn: $isFavorite) {
                    Text("Add to favorite")
                }
            }
            
            Section {
                NutrientInputField(value: $protein, for: Predefined.Nutrients.Protein)
                NutrientInputField(value: $calorie, for: Predefined.Nutrients.Calorie)
            }
        }
        .navigationTitle(
            food != nil ? "Update Food" : "New Food"
        )
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem {
                Button {
                    saveUpdate()
                } label: {
                    Text("Save")
                        .disabled(!validated)
                }
                
            }
        }.onAppear {
            if let food = food {
                foodGroup = food.group
                foodName = food.name
                isFavorite = food.isFavorite
                if let protein = food.nutrition[.protein] {
                    self.protein = protein
                }
                if let calorie = food.nutrition[.calorie] {
                    self.calorie = calorie
                }
                
            }
        }
    }
}

extension FoodUpdateView {
    func NutrientInputField(value: Binding<Double?>, for nutrient: Nutrient) -> some View {
        return HStack {
            Text(nutrient.category.rawValue.capitalized)
            TextField(nutrient.unit, value: value, formatter: numberFormatter)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
        }
    }
}

extension FoodUpdateView {
    func saveUpdate() {
        if let food = food {
            food.name = foodName
            food.isFavorite = isFavorite
            if let protein = protein {
                food.nutrition[.protein] = protein
            }
            if let calorie = calorie {
                food.nutrition[.calorie] = calorie
            }
        } else {
            let newFood = Food(name: foodName,
                               information: "",
                               nutrition: [:],
                               isFavorite: isFavorite,
                               icon: "",
                               group: foodGroup)
            if let calorie = calorie {
                newFood.nutrition[.calorie] = calorie
            }
            if let protein = protein {
                newFood.nutrition[.protein] = protein
            }
            context.insert(newFood)
        }
        dismiss()
    }
}

#Preview {
    NavigationStack {
        FoodUpdateView()
    }
}
