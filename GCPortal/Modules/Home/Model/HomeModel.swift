//
//  HomeModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct HomeModel: Decodable {
    
    let id: Int
    let status: Int
    let course: String
    let vacancyCount: Int
    let salaryMin: Int
    let salaryMax: Int
    let isCurrent: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case course = "stageName"
        case vacancyCount = "vacancyCount"
        case salaryMin = "costMin"
        case salaryMax = "costMax"
        case isCurrent = "current"
    }
    
}
