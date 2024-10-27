//
//  AppTabViewCore.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//

import Foundation
import SwiftUI

@Observable
class AppTabViewCore {
    var keyView: [AnyHashable: AnyView] = [:]
    var selection: AnyHashable? = nil
    
    func setSelection<SelectedValue: Hashable>(_ selection: SelectedValue) {
        self.selection = selection
    }
    
    func isValueSelected<SelectedValue: Hashable>(_ value: SelectedValue) -> Bool {
        return self.selection == AnyHashable(value)
    }
    
    func updateKeyView<Key: Hashable, Content: View>(key: Key, view: Content) {
        self.keyView[key] = AnyView(view)
    }
}
