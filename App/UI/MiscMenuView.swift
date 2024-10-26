//
//  MiscMenuView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import SwiftUI

struct MiscMenuView: View {
    var body: some View {
        List {
            Section(header: Text("Food")) {
                HStack {
                    NavigationLink {
//                        FoodListView()
                    } label: {
                        Image("nutrition")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Nutrition Facts")
                    }
                }
            }
        }.navigationTitle("Misc")
    }
}

#Preview {
    NavigationView {
        MiscMenuView()
    }
}
