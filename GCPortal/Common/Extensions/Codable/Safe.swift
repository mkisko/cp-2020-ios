//
//  Safe.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct Safe<Base: Decodable>: Decodable {
    
    let value: Base?
    
    init(from decoder: Decoder) throws {
        
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Base.self)
        } catch {
            self.value = nil
        }
    }
    
}
