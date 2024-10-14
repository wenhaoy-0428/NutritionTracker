////
////  NutritionDetailView.swift
////  App
////
////  Created by Wenhao Yan on 2024/10/12.
////
//
//import SwiftUI
//
//
//struct NutritionDetailView: View {
//    let targetIntakes: Double = 20
//    let currentIntake: Double = 20
//    let unit: String = "mg"
//    var kinds: [String] = ["Apple", "Banana"]
//    
//    @Environment(\.colorScheme) private var colorScheme
//
//    
//    var body: some View {
//        ScrollView {
//            ForEach(kinds, id: \.self) { kind in
//                VStack {
//                    HStack() {
//                        Circle()
//                            .foregroundStyle(.secondary)
//                            .frame(width: 40, height: 40)
//                            .overlay {
//                                Text("99")
//                                    .bold()
//                                    .foregroundStyle(colorScheme == .dark ? Color.black.opacity(0.5): .white)
//                                    .font(.title3)
//                            }
//                        VStack(alignment: .leading) {
//                            Text(kind)
//                                .font(.headline)
//                            Text("\(String(format: "%.1f", currentIntake))/\(String(format: "%.0f", targetIntakes))\(unit)")
//                                .bold()
//                                .foregroundStyle(getDisplayColor(name: kind))
//                        }
//                        
//                        Spacer()
//                        
//                    }
//                }
//                .padding()
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundStyle(colorScheme == .dark ? Color(red: 0.1, green: 0.1, blue: 0.1) : .white)
//                        .shadow(radius: 3, y:2)
//                ).padding(3)
//            }
//        }
//        .padding()
////        .background(.green)
//        
//    }
//    
//    
//}
//
//extension NutritionDetailView {
//    
//    /**
//     A helper function that helps to generate Color based on the name of the kind
//     
//        - Parameter name: The name of the kind that is hashed into Color
//        - Returns: A color that is always bound to the name
//     */
//    func getDisplayColor(name: String) -> Color {
//        let displayColors: [Color] = [.red,
//                                      .green,
//                                      .blue,
//                                      .yellow,
//                                      .orange,
//                                      .purple,
//                                      .pink,
//                                      .gray]
//        var totalVal = 0
//        for char in name {
//            if let asciiValue = char.asciiValue {
//                totalVal += Int(asciiValue)
//            }
//        }
//        return displayColors[totalVal % displayColors.count]
//    }
//    
//}
//
//#Preview {
//    NutritionDetailView()
//}
