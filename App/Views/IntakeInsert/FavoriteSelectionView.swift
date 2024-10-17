//
//  FavoriteSelection.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/15.
//

import SwiftUI

struct FavoriteSelectionView: View {
    @Binding var selectedFood: Food?
    let food: Food
        
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(Color("lightgray"))
                
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 25, height: 25)
                
            }
            .frame(width: 40, height: 40)
            .overlay {
                if selectedFood == food {
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(.blue, lineWidth: 3)
                }
            }
            .onTapGesture {
                selectedFood = food
            }
            Text(food.name)
                .font(.caption)
        }
    }
}

#Preview {
    @Previewable @State var temp: Food? = Predefined.Foods.Apple
    var food: Food = Food(name: "Cherry", information: "", nutrition: [:], icon: "apple.logo", group: .fruit)
    FavoriteSelectionView(selectedFood: $temp, food: food)
}
