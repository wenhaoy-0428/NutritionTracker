//
//  AppErrorDispatcher.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//
import Foundation

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
