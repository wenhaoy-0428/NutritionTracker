//
//  ErrorHandler.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI

struct ErrorHandler: View {
    let error: Error
    
    init(_ error: Error) {
        self.error = error
    }
    
    var body: some View {
        ContentUnavailableView("Hello", image: "exclamationmark.questionmark", description: Text("An Error Occurred"))
    }
}

#Preview {
}
