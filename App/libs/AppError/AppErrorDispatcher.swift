//
//  AppErrorDispatcher.swift
//  App
//
//  Created by Wenhao Yan on 2024/10/26.
//
import Foundation

@Observable
final class AppErrorDispatcher {
    static let shared = AppErrorDispatcher()
    var activeError: AppError? = nil
    var isActive = false
    
    
    private init() {}
    private let queue = DispatchQueue(label: "app_error_dispatcher_queue")
    
    
    func dispatchError(_ appError: AppError) {
        queue.async {
            self.activeError = appError
            self.isActive = true
        }
    }
    
    func clearError() {
        queue.async {
            self.isActive = false
        }
    }
}
