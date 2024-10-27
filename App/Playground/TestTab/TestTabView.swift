//
//  TabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//
/*
import SwiftUI

struct TestTabView<Content: View>: View {
    
    let content: Content
    @Binding var selection: TestTabBarItem.Item
    @State private var tab: TestTabBarItem = TestTabBarItem(items: [])
    
    init( selection: Binding<TestTabBarItem.Item>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._selection = selection
    }
    
    var body: some View {
        content
            .environment(tab)
        ForEach(tab.items, id: \.self) {item in
            HStack {
                tab.tabView(item: item)
            }
        }
    }
}

#Preview {
    @Previewable @State var selection: TestTabBarItem.Item = .home
    TestTabView(selection: $selection) {
        Text("")
            .tabBarItem(tab: .home)
        
        Text("")
            .tabBarItem(tab: .misc)

    }
}
*/
