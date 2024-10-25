//
//  MiscTabBarItem.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI

struct MiscTabBarItem: View {
    var body: some View {
        VStack{
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Text("Misc")
                .font(.system(size: 11))
        }
    }
}

#Preview {
    MiscTabBarItem()
}
