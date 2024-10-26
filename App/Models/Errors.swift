//
//  Errors.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/25.
//

import Foundation
import OSLog

@Observable
class AppErrorDispatcher {
    private(set) var activeError: AppLocalizedError? = nil
    
    var active: Bool {
        activeError != nil
    }
    
    func dispatchError(_ appError: AppError) {
        activeError = appError.error
    }
    
    func clearError() {
        activeError = nil
    }
}

// Auto Logger
struct AppError: Error {
    let error: AppLocalizedError
    private var logger: Logger = Logger()
    
    init(error: AppLocalizedError, logger: Logger? = nil, debugInfo: String? = nil) {
        self.error = error
        if let logger {
            self.logger = logger
        }
        self.logger.error("Error(\(error.severity.rawValue)): \(error.failureReason ?? "null"); debugInfo: \(debugInfo ?? "null")")
    }
}

enum Severity: String {
    case minor
    case major
    case critical
}

protocol AppLocalizedError: LocalizedError {
    var severity: Severity {get}
}

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
