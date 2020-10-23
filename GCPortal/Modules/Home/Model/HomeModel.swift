//
//  HomeModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

struct HomeModel: Decodable {
    
    let course: String
    let isComplete: Bool
    let salary: String
    let vacancyCount: Int
    
    enum CodingKeys: String, CodingKey {
        case course = ""
        case isComplete = "a"
        case salary = "b"
        case vacancyCount = "c"
    }
    
}
