//
//  NutritionMainView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import SwiftUI
import SwiftData

struct NutritionMainView: View {
    let columns = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]
    
    @Environment(\.modelContext) private var context
    @Query(filter: Intake.filterByToday()) private var intakes: [Intake]
    @Query private var nutrients: [Nutrient]
    @Query private var foods: [Food]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(nutrients, id: \.self) { nutrient in
                    NutritionCardView(for: nutrient, intakes: intakes)
                }
            }.padding(5)
        }.toolbarVisibility(.hidden, for: .navigationBar)
        // NOTE: toolBarVisibility used to get avoid of the abnormal behavior of NavigationBar sliding from top on appear for other view.
    }
}

#Preview {
    NutritionMainView()
        .modelContainer(DataController.previewContainer)
}
