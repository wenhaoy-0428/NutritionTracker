//
//  AppTabBarView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI

struct AppTabBarView: View {
    let tabs: [AppTabBarItem]
    @Binding var selection: AppTabBarItem
    
    var body: some View {
        if !tabs.isEmpty {
            Grid(alignment: .bottom, horizontalSpacing: 60, verticalSpacing: 0) {
                GridRow {
                    Button {
                        selection = tabs[0]
                    } label: {
                        tabs[0].tabView
                    }
                    MainInsertButton()
                        .offset(y: -25)
                    
                    Button {
                        selection = tabs[1]
                    } label: {
                        tabs[1].tabView
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 35)
            .background(Color(UIColor.systemBackground))
            .clipShape(ArcShape())
        }
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
