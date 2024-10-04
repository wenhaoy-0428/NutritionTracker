//
//  WidgeItemView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/3.
//

import SwiftUI

struct WidgetItemView: View {

    let title: String
    let bgColor: Color
    let icon: String
    let validityDate: Int = 1
    let validityColors: [Color] = [.red, .orange, .yellow, .white]

    init(title: String, icon: String, category: Category) {
        self.title = title
        self.icon = icon

        switch category {
        case .Grocery:
            self.bgColor = .green
        case .Utility:
            self.bgColor = .blue
        }
    }

    enum Category {
        case Grocery
        case Utility
    }

    private var clipShape: some Shape {
        RoundedRectangle(
            cornerRadius: 10
        )
    }

    var body: some View {

        ZStack {
            clipShape
                .shadow(radius: 3, y: 3)

            VStack {
                HStack(spacing: 1) {
                    Text(self.icon)
                    Text(self.title)
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()

                    Spacer()
                }
                .frame(maxWidth: .infinity)

                Spacer()

                HStack(spacing: 3) {
                    Spacer()
                    Text("\(self.validityDate)")
                        .foregroundColor(
                            validityColors[
                                min(validityDate, validityColors.count - 1)]
                        )
                        .font(.title2)
                        .bold()

                    if self.validityDate < 0 {
                        Text("Expired")
                            .foregroundColor(.red)
                    } else {
                        Text("\(self.validityDate > 1 ? "days" : "day")")
                            .italic()
                    }

                }
                .foregroundColor(.white)
            }
            .padding(5)
            .background(Color.green)
            .clipShape(self.clipShape)
            .contentShape(ContentShapeKinds.contextMenuPreview, self.clipShape)
            .contextMenu {
                Button {
                    // Add this item to a list of favorites.
                } label: {
                    Label("Add to favorite", systemImage: "heart")
                }
                Button {
                    // Open Maps and center it on this item.
                } label: {
                    Label("More", systemImage: "ellipsis")
                }
            }
        }
        .frame(width: 150, height: 70)

    }
}

#Preview {
    WidgetItemView(title: "Tomato", icon: "\u{1F345}", category: .Grocery)
}
