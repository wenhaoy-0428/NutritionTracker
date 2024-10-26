//
//  FoodListView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI
import SwiftData

struct FoodListView: View {
    @Query var foods: [Food]
    @State var selectedFood: Food? = nil
    
    
    var foodCollection: [Food.Group:[Food]] {
        foods.reduce(into: [:]) { partialResult, food in
            if partialResult[food.group] == nil {
                partialResult[food.group] = [food]
            } else {
                partialResult[food.group]!.append(food)
            }
        }
    }
    
        
    var body: some View {
        List {
            ForEach(Food.Group.allCases, id: \.self) { group in
                if let collection = foodCollection[group] {
                    Section(header: Text(group.rawValue)) {
                        ForEach(collection) {food in
                            Button {
                                selectedFood = food
                            } label: {
                                Text(food.name)
                            }
                            .swipeActions {
                                Button {
                                    food.isFavorite.toggle()
                                } label: {
                                    Image(systemName: food.isFavorite ? "heart.slash.fill" : "heart")
                                }
                                .tint(.pink)
                                
                                NavigationLink("Edit") {
                                    FoodUpdateView(for: food)
                                }
                            }
                        }
                    }
                }
            }
        }.sheet(item: $selectedFood) {
            selectedFood = nil
        } content: { food in
            FoodNutritionFactView(for: food)
        }

    }
}

#Preview {
    FoodListView()
        .appPreviewSetUp()
}
