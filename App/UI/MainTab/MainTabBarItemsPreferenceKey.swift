//
//  MainTabBarItemsPreferenceKey.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import Foundation
import SwiftUI


struct MainTabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [MainTabBarItem] = []
    
    static func reduce(value: inout [MainTabBarItem], nextValue: () -> [MainTabBarItem]) {
        value += nextValue()
    }
}

struct MainTabBarItemViewModifier: ViewModifier {
    
    // init
    let tab: MainTabBarItem
    let selection: MainTabBarItem
    func body(content: Content) -> some View {
        if selection == tab {
            content
                .preference(key: MainTabBarItemsPreferenceKey.self, value: [tab])
        } else {
            EmptyView()
        }
    }
}

extension View {
    func mainTabbarItem(tab: MainTabBarItem, selection: MainTabBarItem) -> some View {
        modifier(MainTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
