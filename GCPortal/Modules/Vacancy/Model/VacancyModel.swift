//
//  VacancyModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct VacancyModel: Decodable {
    let id: Int
    let title: String
    let description: String
    let skills: [SkillModel]
    let minCost: Int
    let maxCost: Int
    let typeIntern: Int
    let user: UserModel
    let expiried: Date
    let publishedAt: Date
    let conditions: String
    
    enum CodingKeys: String, CodingKey {
        case id             = "id"
        case title          = "title"
        case description    = "description"
        case skills         = "skills"
        case minCost        = "minCost"
        case maxCost        = "maxCost"
        case typeIntern     = "typeIntern"
        case user           = "user"
        case expiried       = "expired"
        case publishedAt    = "publichedAt"
        case conditions     = "conditions"
    }
}
