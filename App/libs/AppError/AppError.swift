//
//  AppError.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//

import Foundation
import OSLog

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
