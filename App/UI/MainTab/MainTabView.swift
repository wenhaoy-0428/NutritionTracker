//
//  MainTabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//

import SwiftUI

struct MainTabView<Content: View>: View {
    
    @State private var index: Int = 0
    @State private var tabs: [MainTabBarItem] = []
    @Binding var selection: MainTabBarItem
    private let content: Content
    
    init(selection: Binding<MainTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                // Content
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
                // TabBar
                MainTabBarView(tabs: tabs)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        } // Listen to PreferenceKey to update registered tabs
        .onPreferenceChange(MainTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct MainTabBarView: View {
    let tabs: [MainTabBarItem]
    
    var body: some View {
        if !tabs.isEmpty {
            Grid(alignment: .bottom, horizontalSpacing: 60, verticalSpacing: 0) {
                GridRow {
                    tabs[0].tabView
                    MainInsertButton()
                        .offset(y: -25)
                    tabs[1].tabView
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


#Preview {
    let tabs: [MainTabBarItem] = [.home, .misc]
    let selection: MainTabBarItem = .home
    
    MainTabView(selection: .constant(tabs.first!)) {
        Color.red
            .mainTabbarItem(tab: .home, selection: selection)
        
        Color.green
            .mainTabbarItem(tab: .misc, selection: selection)
    }
}
