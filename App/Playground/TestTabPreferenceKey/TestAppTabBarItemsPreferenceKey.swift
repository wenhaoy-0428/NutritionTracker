//
//  AppTabBarItemsPreferenceKey.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

/*
import Foundation
import SwiftUI

// https://www.youtube.com/watch?v=FxW9Dxt896U&t=1388s

// onPreferenceChange requires Equatable.
// Use pair so that we can conditionally render view based on the selected pair.
// Dic is not used due to its internal storage will randomize the order of insersion.
struct TestAppTabViewPair: Equatable {
    static func == (lhs: TestAppTabViewPair, rhs: TestAppTabViewPair) -> Bool {
        lhs.tab == rhs.tab
    }
    init(tab: AppTabBarItem, view: any View) {
        self.tab = tab
        self.view = view
        
        print("CNMD")
    }
    let tab: AppTabBarItem
    let view: any View
}

struct TestAppTabBarItemsPreferenceKey2: PreferenceKey {
    static var defaultValue: [TestAppTabViewPair] = []
    
    static func reduce(value: inout [TestAppTabViewPair], nextValue: () -> [TestAppTabViewPair]) {
        value += nextValue()
    }
}

struct TestAppTabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [AppTabBarItem] = []
    
    static func reduce(value: inout [AppTabBarItem], nextValue: () -> [AppTabBarItem]) {
        value += nextValue()
    }
}

struct TestAppTabBarItemViewModifier: ViewModifier {
    
    // init
    let tab: AppTabBarItem
    let selection: AppTabBarItem
    // Content is the TabView.
    func body(content: Content) -> some View {
        content
//            .preference(key: AppTabBarItemsPreferenceKey.self, value: [tab])
            .preference(key: TestAppTabBarItemsPreferenceKey2.self, value: [TestAppTabViewPair(tab: tab, view: content)])
    }
}

extension View {
    func appTabBarItem(tab: AppTabBarItem, selection: AppTabBarItem) -> some View {
        modifier(TestAppTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
*/
