//
//  AppErrorDispatcher.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//
import Foundation

@Observable
class AppErrorDispatcher {
    var activeError: AppError? = nil
    
    var active = false
    
    func dispatchError(_ appError: AppError) {
        activeError = appError
    }
    
    func clearError() {
        activeError = nil
    }
}
