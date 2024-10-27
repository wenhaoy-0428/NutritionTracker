//
//  TabBarItem.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//


/*
import SwiftUI

@Observable
class TestTabBarItem {
    var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    enum Item {
        case home, misc
    }
    
    @ViewBuilder func tabView(item: TestTabBarItem.Item) -> some View {
        switch item {
        case .home: Text("Home").frame(width: 50, height: 50)
        case .misc: Text("Misc").frame(width: 50, height: 50)
        }
    }
}


struct TabBarItemViewModifier: ViewModifier {
    @Environment(TestTabBarItem.self) var tabs
    let tab: TestTabBarItem.Item
    
    init(tab: TestTabBarItem.Item) {
        self.tab = tab
    }
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                tabs.items.append(tab)
            }
    }
}

extension View {
    func testTabBarItem(tab: TestTabBarItem.Item) -> some View {
        modifier(TabBarItemViewModifier(tab: tab))
    }
}

#Preview {
    @Previewable @State var tabItem: TestTabBarItem = TestTabBarItem(items: [])
    let tab: TestTabBarItem.Item = .home

    HStack {
        Text("Hello, world!")
            .testTabBarItem(tab: tab)
    }.environment(tabItem)
}
**/
