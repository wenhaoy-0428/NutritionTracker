//
//  AppTabView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI



struct AppTabView<SelectionValue: Hashable, Content: View>: View {
    
    
    @Binding var defaultSelection: SelectionValue
    @State var core: AppTabViewCore = AppTabViewCore()
    // TabItems
    let content: Content
    
    init(selection: Binding<SelectionValue>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._defaultSelection = selection
    }

    var body: some View {
        ZStack(alignment: .bottom) {
//            Color.clear
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            ZStack {
                Color(UIColor.secondarySystemBackground)
                displayView()
            }
            // NOTE: AppTabViewCor is only available when TabBarItem renders
            AppTabBarView(content)
                .ignoresSafeArea()
                .environment(core)
        }.background(Color.red)
            .onAppear {
                if core.selection == nil {
                    core.selection = self.defaultSelection
                }
            }
    }
    
    func displayView() -> AnyView {
        // User has selected one.
        var res = AnyView(EmptyView())
        if let userSelection = core.selection {
            guard let view = core.keyView[userSelection] else {
                // ERROR
                return res
            }
            res = view
        } else {
            guard let view = core.keyView[self.defaultSelection] else {
                // ERROR
                return res
            }
            res = view
        }
        return res
    }
}

#Preview {
    NavigationStack {
        AppTabView(selection: .constant(1)) {
            AppTab (value: 1) {
                List {
                    NavigationLink {
                        Text("nest")
                    } label: {
                        Text("content1")
                    }
                }
                    .navigationTitle(Text("title1"))
            } label: {
                Text("Label")
            }
            Text("")
            
            AppTab (value: 2) {
                
                Text("content2")
                    .navigationTitle(Text("title2"))
            } label: {
                Text("Label")
                Spacer()
            }
            Text("")
            
            AppTab (value: 3) {
                Text("content3")
                    .navigationTitle(Text("title3"))
            } label: {
                Text("Label")
            }
            
            AppTab (value: 4) {
                Text("content4")
                    .navigationTitle(Text("title4"))
            } label: {
                Text("Label")
            }
            Text("")
            Text("")
        }
    }.appPreviewSetUp()
}
