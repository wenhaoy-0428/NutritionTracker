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
    @Environment(\.colorScheme) private var colorScheme
    
    var currentIntake: Double {getTotalIntake()}
    
    init(for nutrient: Nutrient, intakes: [Intake]) {
        self.nutrient = nutrient
        self.intakes = intakes.sorted(by: { a, b in
            return a.getNutrition(for: nutrient.category) > b.getNutrition(for: nutrient.category)
        })
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
                    HStack(spacing: 3) {
                        Image(nutrient.icon)
                            .resizable()
                            .scaledToFit()
                        Text(nutrient.category.rawValue.capitalized)
                            .font(.headline)
                        Spacer()
                    }.frame(height: 25)
                    Spacer()
                    progressBar
                }
                .padding(10)
                
            }
            .frame(height: 100)
            .sheet(isPresented: $openDetail) {
                NutritionDetailSheet()
                .presentationDetents([.medium, .large])
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
                    ProgressView(value: min(1, currentIntake / nutrient.maxIntake)) {}
                        .tint(getProgressBarColor())
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
                    Text(nutrient.unit.rawValue)
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

// MARK: DetailSheet

extension NutritionCardView {
    
    func NutritionDetailSheet() -> some View {
        Group {
            if intakes.isEmpty {
                VStack {
                    Spacer()
                    Image("bento-box")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                    Text("You haven't eaten anything yet")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Spacer()
                }
            } else {
                ScrollView {
                    ForEach(intakes) { intake in
                        VStack {
                            HStack() {
                                Circle()
                                    .foregroundStyle(.secondary)
                                    .frame(width: 40, height: 40)
                                    .overlay {
                                        Text("\(String(format: "%.0f", intake.amount * (intake.food.nutrition[nutrient.category] ?? 0) / getTotalIntake() * 100))")
                                            .bold()
                                            .foregroundStyle(colorScheme == .dark ? Color.black.opacity(0.5): .white)
                                            .font(.title3)
                                    }
                                VStack(alignment: .leading) {
                                    Text(intake.food.name)
                                        .font(.headline)
                                    Text("\(String(format: "%.1f", intake.amount * (intake.food.nutrition[nutrient.category] ?? 0)))/\(String(format: "%.0f", nutrient.targetIntake))\(nutrient.unit)")
                                        .bold()
                                        .foregroundStyle(getDisplayColor(for: intake.food.name))
                                }
                                
                                Spacer()
                                
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(colorScheme == .dark ? Color(red: 0.1, green: 0.1, blue: 0.1) : .white)
                                .shadow(radius: 3, y:2)
                        ).padding(3)
                    }
                }
                .padding()
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
    
    /**
     A helper function that helps to generate Color based on the food
     
        - Parameter name: The name of the food that is hashed into Color
        - Returns: A color that is always bound to the name
     */
    func getDisplayColor(for name: String) -> Color {
        let displayColors: [Color] = [.red,
                                      .green,
                                      .blue,
                                      .yellow,
                                      .orange,
                                      .purple,
                                      .pink,
                                      .gray]
        var totalVal = 0
        for char in name {
            if let asciiValue = char.asciiValue {
                totalVal += Int(asciiValue)
            }
        }
        return displayColors[totalVal % displayColors.count]
    }
    
    func getTotalIntake() -> Double {
        var total = 0.0
        for intake in intakes {
            let nutrition = intake.food.nutrition
            for (key, value) in nutrition {
                total += key == nutrient.category ? value * intake.amount : 0
            }
        }
        return total
    }
}


