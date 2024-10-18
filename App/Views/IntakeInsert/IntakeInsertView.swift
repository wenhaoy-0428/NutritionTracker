//
//  IntakeInsertView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/15.
//

import SwiftUI
import SwiftData


struct IntakeInsertView: View {
    
    @Query var foods: [Food]
    @State var intakeAmount: Double = 100
    @State var searchText: String = ""
    @State var searchFocus: Bool = false
    @Query var nutrients: [Nutrient]
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Environment(\.dismissSearch) var dismissSearch
    @Environment(SheetData.self) var sheetData: SheetData
        
    var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }()
    
    
    
    var favorieFoods: [Food] {
        foods.filter { food in
            food.isFavorite
        }
    }
    
    let layout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
    var body: some View {
        ZStack {
            VStack{
                List {
                    // Favorites
                    if !favorieFoods.isEmpty {
                        Section(header: Text("Favorites")) {
                            LazyVGrid(columns: layout, spacing: 10) {
                                ForEach(favorieFoods) {food in
                                    FavoriteSelectionView(food: food)
                                }
                            }
                        }
                    }
                    
                    // Nutrition display
                    Section(header: Text("Nutrition")) {
                        HStack {
                            VStack {
                                Text(sheetData.selectedFood?.name ?? "Food")
                                    .font(.largeTitle)
                                    .bold()
                                if let information = sheetData.selectedFood?.information {
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
                        
                        HStack {
                            Text("Amount")
                            Spacer()
                            TextField("g/ml", value: $intakeAmount, formatter: numberFormatter)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                            
                        }
                        
                        ForEach(nutrients) {nutrient in
                            HStack {
                                Image(systemName: "apple.logo")
                                Text(nutrient.category.rawValue.capitalized)
                                Spacer()
                                if let nutrition = sheetData.selectedFood?.nutrition[nutrient.category]  {
                                    Text(String(format: "%.1f", nutrition * intakeAmount / 100))
                                } else {
                                    Text("-")
                                }
                                Text(nutrient.unit)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            sheetData.dismissClosure = { dismissSearch() }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItem {
                Button {
                    saveNewIntake()
                    dismiss()
                } label: {
                    Text("Record")
                }.disabled(sheetData.selectedFood == nil)
            }
        }
    }
}

extension IntakeInsertView {
    func suggestionView() -> some View {
        Group {
            
        }
    }
}

extension IntakeInsertView {
    func saveNewIntake() {
        guard sheetData.selectedFood != nil else {
            return
        }
        let newIntake = Intake(food: sheetData.selectedFood!, amount: intakeAmount)
        context.insert(newIntake)
    }
}

#Preview {
    NavigationStack {
        IntakeInsertView()
    }
}
