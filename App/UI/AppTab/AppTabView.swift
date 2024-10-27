//
//  AppTabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI



struct AppTabView<SelectionValue: Hashable, Content: View>: View {
    
    
    @Binding var selection: SelectionValue
    @State var appTabViewCore: AppTabViewCore<AnyHashable, AnyView> = AppTabViewCore()
    // TabItems
    let content: Content
    
    init(selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._selection = selection
    }

    var body: some View {
        ZStack(alignment: .bottom) {
//            Color.clear
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            ZStack {
                Color(UIColor.secondarySystemBackground)
                appTabViewCore.keyView[selection]
            }
            // NOTE: AppTabViewCor is only available when TabBarItem renders
            AppTabBarView(content)
                .ignoresSafeArea()
                .environment(\.appTabViewCore, appTabViewCore)
        }.background(Color.red)
    }
}

#Preview {
    AppTabView(selection: .constant(1)) {
        AppTab (value: 1) {
            Text("content")
        } label: {
            Text("Label")
        }
        Text("")
        
        AppTab (value: 2) {
            Group {
                Text("content")

            }
        } label: {
            Text("Label")
            Spacer()
        }
        Text("")
        
        AppTab (value: 3) {
            Text("content")
        } label: {
            Text("Label")
        }
        
        AppTab (value: 2) {
            Text("content")
        } label: {
            Text("Label")
        }
        Text("")
        Text("")
    }.appPreviewSetUp()
}
