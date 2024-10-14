//
//  SwiftUIView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/11.


import SwiftUI
import SwiftData
// MARK: Main
struct NutritionCardView: View {
    
    var nutrient: Nutrient
    var intakes: [Intake]
    
    @State var openDetail: Bool = false
    var currentIntake: Double {
        var total = 0.0
        for intake in intakes {
            let nutrition = intake.food.nutrition
            for (key, value) in nutrition {
                total += key == nutrient.category ? value : 0
            }
        }
        return total
    }
    
    
    init(for nutrient: Nutrient, intakes: [Intake]) {
        self.nutrient = nutrient
        self.intakes = intakes 
    }
    
    var body: some View {
        Button(action: {
            openDetail = true
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(radius: 3, x: 0, y:2)
                
                VStack {
                    HStack(spacing: 0) {
                        Text(nutrient.icon)
                        Text(nutrient.category.rawValue.capitalized)
                            .font(.headline)
                        Spacer()
                    }
                    Spacer()
                    progressBar
                }
                .padding(10)
                
            }
            .frame(height: 100)
            .sheet(isPresented: $openDetail) {
                //                NutritionDetailView()
                //                    .presentationDetents([.medium, .large])
            }
        }.foregroundStyle(.primary)
            .padding(3)
    }
}

// MARK: ProgessBar
extension NutritionCardView {
    
    var progressBar: some View {
        VStack(spacing: 10) {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    ProgressView(value: currentIntake / nutrient.maxIntake) {
                    }
                    //                        .tint(getProgressBarColor())
                    Capsule()
                        .rotation(Angle(degrees: 90))
                        .foregroundStyle(.secondary)
                        .frame(width: 10, height: 1)
                        .offset(x: geometry.size.width * 0.8333)
                    
                }
            }.frame(height: 0)
            
            HStack(spacing: 0) {
                Spacer()
                Group {
                    Text("\(String(format: "%.1f", currentIntake))")
                    Text("/")
                    Text("\(String(format: "%.0f", nutrient.targetIntake))")
                    Text(nutrient.unit)
                        .font(.caption)
                        .bold()
                        .foregroundStyle(.orange)
                }
                .italic()
                .bold()
            }
        }
    }
}

extension NutritionCardView {
    func getProgressBarColor() -> Color {
        if currentIntake >= nutrient.minIntake && currentIntake < nutrient.targetIntake {
            return Color.green
        } else if currentIntake >= nutrient.targetIntake && currentIntake < nutrient.maxIntake {
            return Color.orange
        } else if currentIntake > nutrient.maxIntake {
            return Color.red
        }
        return Color.blue
    }
}

//#Preview {
//    NutritionCardView(nutrition: NutrientDetail(kind: "Calorie", icon: "🥘", description: "Calorie", targetIntake: 2400, currentIntake: 300, unit: "KCAL"))
//}
