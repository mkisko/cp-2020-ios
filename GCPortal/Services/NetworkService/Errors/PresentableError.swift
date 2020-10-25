//
//  PresentableError.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol PresentableError where Self: Error {
    var userMessage: String { get }
    var isNetworkError: Bool { get }
}

extension APIError {
    
    var isNetworkError: Bool {
        switch self {
        case .noNetwork:    return true
        default:            return false
        }
    }
    
}

