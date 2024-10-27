//
//  AppTabBarItem.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/24.
//

import SwiftUI

enum AppTabBarItem{
    case main, misc
    
    @ViewBuilder var tabView: some View {
        switch self {
        case .main: MainTabBarItem()
        case .misc: MiscTabBarItem()
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
        .frame(height: 50)
        .clipped()
        .foregroundStyle(selected ? Color.blue : Color.gray)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    HStack {
        AppTabBarItemView(selected: true) {
            //
        } label: {
            MainTabBarItem()
        }
    }.background(Color.green)
}
