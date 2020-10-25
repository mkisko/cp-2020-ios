//
//  UserModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
    let id: Int
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
    }
}
