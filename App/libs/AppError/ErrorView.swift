//
//  ErrorView.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import SwiftUI

struct ErrorView: View {
    let appError: AppError
    
    init(for appError: AppError) {
        self.appError = appError
    }
    
    var body: some View {
        ContentUnavailableView {
            Label("An Error Occurred", systemImage: "exclamationmark.questionmark")
        } description: {
            Text(appError.error.localizedDescription)
        }
    }
}

#Preview {
    let appError = AppError(error: DataError.PredefinedDataMismatch)
    ErrorView(for: appError)
}
