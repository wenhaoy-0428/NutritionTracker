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
            ZStack {
                InsertTabBarItem()
                    .offset(y: -30)
                
                HStack(spacing: 25) {
                    Spacer()
                    ForEach(tabs, id: \.self) { tab in
                        AppTabBarItemView(selected: selection == tab) {
                            selection = tab
                        } label: {
                            tab.tabView
                        }
                        Spacer()
                    }
                }.frame(maxWidth: .infinity).padding(Edge.Set([.top]), 5)
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

#Preview {
    let tabs: [AppTabBarItem] = [.main, .misc]
    VStack {
        Spacer()
        AppTabBarView(tabs: tabs, selection: .constant(.main))
    }
    .ignoresSafeArea()
    .background(Color.red)
}
