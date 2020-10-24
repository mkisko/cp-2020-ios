//
//  SkillModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct SkillModel: Decodable {
    let id: Int
    let title: String
    
    enum CodeingKeys: String, CodingKey {
        case id = "id"
        case title = "My SQL"
    }
}
