//
//  Errors.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

// MARK: DataError
enum DataError: AppLocalizedError {
    case PredefinedDataMismatch
    
    var severity: Severity {
        switch self {
        case .PredefinedDataMismatch:
            return .critical
        }
    }
    
    var failureReason: String? {
        switch self {
        case .PredefinedDataMismatch:
            return "An error occurred when accessing the predefined data"
        }
    }
}
