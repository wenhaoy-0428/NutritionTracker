//
//  SwiftUIView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/4.
//

import SwiftUI

struct Playground: View {
    // 1. Define clipping shape
    private var clipShape: some Shape {
        RoundedRectangle(
            cornerRadius: 20
        )
    }
    
    var body: some View {
        // 2. Wrap everything in ZStack
        ZStack {
            // 3. Add clipShape view below the view that displays the context menu
            clipShape
                .fill(Color.white)
                // 4. Move the shadow modifier to the clipShape view
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "house")
                        .font(.system(size: 50))
                    Spacer()
                }
                Text("SwiftUI for iOS 14").fontWeight(.bold).foregroundColor(Color.white)
                Text("20 Sections").font(.footnote).foregroundColor(Color.white)
            }
            .padding(.all)
            .background(Color.blue)
            // 5. For consistency, apply the same clipShape to this view as well
//            .clipShape(clipShape)
//            .contentShape(
//                // 6: Use the clipShape as the contextMenu's content shape
//                ContentShapeKinds.contextMenuPreview,
//                clipShape
//            )
            .contextMenu(menuItems: {
                Text("Menu Item 1")
                Text("Menu Item 2")
                Text("Menu Item 3")
            })
        }
        // 7. Move the frame modifier to apply to the entire ZStack
        .frame(width: 200, height: 300)
    }
}

#Preview {
    Playground()
}
