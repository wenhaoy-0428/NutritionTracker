//
//  AppTabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/19.
//

import SwiftUI

struct AppTabView<Content: View>: View {
    
    @State private var index: Int = 0
    @State private var tabs: [AppTabBarItem] = []
    @Binding var selection: AppTabBarItem
    private let content: Content
    
    init(selection: Binding<AppTabBarItem>, @ViewBuilder content: () -> Content) {
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
                AppTabBarView(tabs: tabs, selection: $selection)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        } // Listen to PreferenceKey to update registered tabs
        .onPreferenceChange(AppTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}


#Preview {
    @Previewable @State var selection: AppTabBarItem = .home
    let tabs: [AppTabBarItem] = [.home, .misc]
    
    AppTabView(selection: $selection) {
        Color.red
            .mainTabbarItem(tab: .home, selection: selection)
        
        Color.green
            .mainTabbarItem(tab: .misc, selection: selection)
    }
}
