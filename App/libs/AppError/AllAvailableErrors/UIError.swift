//
//  UIError.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//

import Foundation

// MARK: DataError
enum UIError: AppLocalizedError {
    case EnvironmentVariableNotFound
    
    var severity: Severity {
        switch self {
        case .EnvironmentVariableNotFound:
            return .critical
        }
        
    }
    
    var failureReason: String? {
        switch self {
        case .EnvironmentVariableNotFound:
            return "An error occurred when accessing app defined envrionment"
        }
    }
}
