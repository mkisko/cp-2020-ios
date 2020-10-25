//
//  Result.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

typealias EmptyResult = Result<EmptyResponse>
typealias EmptyCompletion = (EmptyResult) -> Void

enum Result<Model> {
    
    case success(Model)
    case failure(APIError)
    
    
    // Returns `true` if the result is a success, `false` otherwise.
    
    public var isSuccess: Bool {
        
        switch self {
        case .success:      return true
        case .failure:      return false
        }
    }
    
    
    // Returns `true` if the result is a failure, `false` otherwise.
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    
    // Returns the associated value if the result is a success, `nil` otherwise.
    
    public var value: Model? {
        
        switch self {
        case .success(let value):   return value
        case .failure:              return nil
        }
    }
    
    
    // Returns the associated error value if the result is a failure, `nil` otherwise.
    
    public var error: APIError? {
        
        switch self {
        case .success:              return nil
        case .failure(let error):   return error
        }
    }
    
}


// MARK: - Equatable
extension Result: Equatable where Model: Equatable {
    
    static func == (lhs: Result, rhs: Result) -> Bool {
        
        switch (lhs, rhs) {
        case (.success(let lhs), .success(let rhs)):
            return lhs == rhs
        case (.failure(let lhs), .failure(let rhs)):
            return lhs == rhs
        default:
            return false
        }
        
    }
    
}
