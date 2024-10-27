//
//  AppTabBarView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI

struct AppTabBarView<Content: View>: View {
    let content: Content
    init(_ content: Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
                .padding(Edge.Set([.top]), 35)

            ZStack(alignment: .top) {
                Color(UIColor.systemBackground)
                        .clipShape(ArcShape())
                    
                HStack {
                    // SPACER in combine with the additional spacer
                    // defined in AppTab
                    Spacer()
                    self.content
                    // Spacer() in AppTab
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(Edge.Set([.top]), 35)
        
                InsertTabBarItem()
                    .offset(y: 10)
            }
        }
        
        .frame(maxHeight: 100)
    }
}


struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x:0, y:35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            path.addArc(center: CGPoint(x: rect.width / 2, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        AppTabBarView(Text("hello"))
    }
    .background(.green)
    
}
