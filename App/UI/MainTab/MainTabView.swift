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
            ZStack(alignment: .bottom) {
                // Content
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
//                Spacer()
                // TabBar
                MainTabBarView(tabs: tabs, selection: $selection)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        } // Listen to PreferenceKey to update registered tabs
        .onPreferenceChange(MainTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}


#Preview {
    @Previewable @State var selection: MainTabBarItem = .home
    let tabs: [MainTabBarItem] = [.home, .misc]
    
    MainTabView(selection: $selection) {
        Color.red
            .mainTabbarItem(tab: .home, selection: selection)
        
        Color.green
            .mainTabbarItem(tab: .misc, selection: selection)
    }
}
