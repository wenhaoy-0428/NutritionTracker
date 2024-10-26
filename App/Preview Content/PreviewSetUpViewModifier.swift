//
//  PreviewSetUpViewModifier.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//

import Foundation
import SwiftUI

struct PreviewSetUpViewModifier: ViewModifier {
    @State var G_AppErrorDispatcher = AppErrorDispatcher()
    
    func body(content: Content) -> some View {
        content
            .modelContainer(DataController.previewContainer)
            .environment(G_AppErrorDispatcher)
    }
}

extension View {
    func appPreviewSetUp() -> some View {
        modifier(PreviewSetUpViewModifier())
    }
}
