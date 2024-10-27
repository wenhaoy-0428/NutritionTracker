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
}
