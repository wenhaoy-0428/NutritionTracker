//
//  MainTabBarItem.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI

struct MainTabBarItem: View {
    var body: some View {
        VStack() {
            Image(systemName: "list.bullet.indent")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text("Main")
                .font(.system(size: 11))
        }
       
    }
}

#Preview {
    MainTabBarItem()
        .background(Color.green)
        .frame(width: 30, height: 30)
}
