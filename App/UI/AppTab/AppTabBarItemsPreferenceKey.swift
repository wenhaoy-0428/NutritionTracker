//
//  AppTabBarItemsPreferenceKey.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import Foundation
import SwiftUI

// https://www.youtube.com/watch?v=FxW9Dxt896U&t=1388s

struct AppTabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [AppTabBarItem] = []
    
    static func reduce(value: inout [AppTabBarItem], nextValue: () -> [AppTabBarItem]) {
        value += nextValue()
    }
}

struct AppTabBarItemViewModifier: ViewModifier {
    
    // init
    let tab: AppTabBarItem
    let selection: AppTabBarItem
    
    // Content is the TabView.
    func body(content: Content) -> some View {
        Group {
            if selection == tab {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Color.clear.frame(width: 0, height: 0)
                    .background(.green)
            }
        }.preference(key: AppTabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func appTabBarItem(tab: AppTabBarItem, selection: AppTabBarItem) -> some View {
        modifier(AppTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
