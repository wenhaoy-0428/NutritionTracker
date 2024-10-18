//
//  FoodSuggestionView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//

import SwiftUI
import SwiftData
struct FoodSuggestionView: View {
    var searchText: String
    @Query var foods: [Food]
    @Environment(SheetData.self) var sheetData: SheetData
    // Computed property for filtered suggestions
    var filteredFoods: [Food] {
        if searchText.isEmpty {
            return foods
        } else {
            return foods.filter {
                $0.name.lowercased().contains(searchText.lowercased()) || $0.group.rawValue.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        if filteredFoods.isEmpty {
            HStack (alignment: .center){
                Spacer()
                VStack {
                    Image(systemName: "refrigerator")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                    Text("No food was found")
                        .font(.title)
                        .bold()
                    NavigationLink("Add a new food") {
                        FoodUpdateView()
                    }
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            .listRowSeparator(.hidden)
            .frame(height: 300)
        } else {
            ForEach (filteredFoods) {food in
                HStack {
                    Image(systemName: "apple.logo")
                    Button {
                        sheetData.selectedFood = food
                        // Dismiss the search bar
                        sheetData.dismissClosure()
                    } label: {
                        VStack(alignment: .leading) {
                            Text(food.name)
                                .foregroundStyle(.primary)
                            Text(food.group.rawValue)
                                .foregroundStyle(.secondary)
                        }
                    }.tint(Color.primary)
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
}

#Preview {
    FoodSuggestionView(searchText: "Hello")
}
