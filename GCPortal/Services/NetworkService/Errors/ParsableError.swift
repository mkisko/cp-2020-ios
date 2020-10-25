//
//  ParsableError.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct ParsableError: Decodable, PresentableError {
    
    // MARK: - Properties
    
//    private let message: String
    let type: String
    let message: String?
    let description: String?

    
    // MARK: - Nested struct
    
    struct DetailError: Decodable {
        let name: String
        let message: String
    }
    
    
    // MARK: - PresentableError
    
    var userMessage: String {
        return message ?? ""
    }
    
    var isNetworkError: Bool {
        return false
    }
}

