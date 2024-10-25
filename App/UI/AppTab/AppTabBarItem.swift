//
//  AppTabBarItem.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import SwiftUI

enum AppTabBarItem{
    case home, misc
    
    @ViewBuilder var tabView: some View {
        switch self {
        case .home: Text("Home").frame(width: 50, height: 50)
        case .misc: Text("Misc").frame(width: 50, height: 50)
        }
    }
}


struct AppTabBarItemView<Content: View>: View{
    
    let label: Content
    let selected: Bool
    let action: @MainActor () -> Void
    
    init(selected: Bool, action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Content) {
        self.label = label()
        self.selected = selected
        self.action = action
    }

    var body: some View {
        label
            .frame(width: 50, height: 50)
            .foregroundStyle(selected ? Color.blue : Color.gray)
            .onTapGesture {
                action()
            }
    }
}
