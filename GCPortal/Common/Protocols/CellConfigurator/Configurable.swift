//
//  Configurable.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

protocol Configurable {
  
    associatedtype Model
    func configure(with model: Model)
}

