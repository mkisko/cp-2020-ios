//
//  SuccessModel.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

struct SuccessModel<Model: Decodable>: Decodable {
    let success: Bool
    let result: Model
}
