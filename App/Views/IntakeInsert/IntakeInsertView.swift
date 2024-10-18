//
//  IntakeInsertView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/15.
//

import SwiftUI
import SwiftData

struct IntakeInsertView: View {
    @State var selectedFood: Food? = nil
    @Query var foods: [Food]
    
    @State var searchText: String = ""
    @Query var nutrients: [Nutrient]
    
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
    
    var favorieFoods: [Food] {
        foods.filter { food in
            food.isFavorite
        }
    }
    
    let layout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    List {
                        if !favorieFoods.isEmpty {
                            Section(header: Text("Favorites")) {
                                LazyVGrid(columns: layout, spacing: 10) {
                                    ForEach(favorieFoods) {food in
                                        FavoriteSelectionView(selectedFood: $selectedFood, food: food)
                                    }
                                }
                            }
                        }
                        
                        Section(header: Text("Nutrition")) {
                            HStack {
                                VStack {
                                    Text(selectedFood?.name ?? "Food")
                                        .font(.largeTitle)
                                        .bold()
                                    if let information = selectedFood?.information {
                                        Text(information)
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .frame(height: 80)
                            }.frame(maxWidth: .infinity)
                                .listRowSeparator(.hidden)
                                .listRowBackground(
                                    Image("apple")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                )
                            
                            ForEach(nutrients) {nutrient in
                                HStack {
                                    Image(systemName: "apple.logo")
                                    Text(nutrient.category.rawValue.capitalized)
                                    Spacer()
                                    if let nutrition = selectedFood?.nutrition[nutrient.category] {
                                        Text(String(format: "%.1f", nutrition))
                                    } else {
                                        Text("-")
                                    }
                                    Text(nutrient.unit)
                                }
                            }
                        }
                    }
                    
                    Button {
                        // TODO:
                    } label: {
                        Text("Add")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.background.secondary)
        }
        .searchable(text: $searchText, prompt: "Search Foods..")
        .searchSuggestions {
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
                            selectedFood = food
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
}

#Preview {
    IntakeInsertView()
}
