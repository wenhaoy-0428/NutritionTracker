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
