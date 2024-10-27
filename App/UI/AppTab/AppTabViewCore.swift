//
//  AppTabViewCore.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//

import Foundation
import SwiftUI

@Observable
class AppTabViewCore<SelectedValue: Hashable, Content: View> {
    var keyView: [SelectedValue: Content] = [:]
    var NMD = 10
}

// Provide default Env for AppTabCore
extension EnvironmentValues {
    @Entry var appTabViewCore: AppTabViewCore<AnyHashable, AnyView>? = nil
}
