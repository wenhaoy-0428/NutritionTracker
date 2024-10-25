//
//  MainTabBarItemsPreferenceKey.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import Foundation
import SwiftUI

// https://www.youtube.com/watch?v=FxW9Dxt896U&t=1388s

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
        Group {
            if selection == tab {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Color.clear.frame(width: 0, height: 0)
                    .background(.green)
            }
        }.preference(key: MainTabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func mainTabbarItem(tab: MainTabBarItem, selection: MainTabBarItem) -> some View {
        modifier(MainTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
