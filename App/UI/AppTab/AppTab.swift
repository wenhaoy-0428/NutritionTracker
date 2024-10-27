//
//  AppTab.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//

import SwiftUI
import OSLog
struct AppTab<Value: Hashable, Content: View, Label: View>: View {
    
    let content: Content
    let label: Label
    let value: Value
    @Environment(\.appTabViewCore) var appTabViewCore: AppTabViewCore?
    @Environment(AppErrorDispatcher.self) var appErrorDispatcher
    
    init(value: Value, @ViewBuilder content: () -> Content, @ViewBuilder label: () -> Label) {
        self.content = content()
        self.label = label()
        self.value = value
        // Updating Env during init is not going to work. IDK WHY
    }
    
    var body: some View {
        Group {
            self.label
            // FOR EVEN PLACEMENT IN THE TAB BAR
            Spacer()
        }
        .onAppear {
            updateAppTabViewCore()
        }
    }
    
    func updateAppTabViewCore() {
        guard let core = appTabViewCore else {
            appErrorDispatcher.activeError = AppError(error: UIError.EnvironmentVariableNotFound, debugInfo: "AppTabViewCore is not available. Tab may be used outside of a TabView")
            return
        }
        core.keyView[self.value] = AnyView(self.content)
    }
}



@Observable
class Temp {
    var temp: Int = 1
}

#Preview {
    AppTab(value: "1") {
        Text("Content")
    } label: {
        Text("Label")
    }.appPreviewSetUp()
}
