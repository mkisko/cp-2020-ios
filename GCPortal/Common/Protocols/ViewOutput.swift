//
//  ViewOutput.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

protocol ViewOutput: AnyObject {
    
    func viewIsReady()
    func viewWillAppear()
    func viewWillDisappear()
    func deInit()
    func didTapDismissButton()
    func viewWillDeinit()
}

extension ViewOutput {
    
    // MARK: - Default implementation
    
    func viewIsReady() { }
    func viewWillAppear() { }
    func viewWillDisappear() { }
    func deInit() { }
    func didTapDismissButton() { }
    func viewWillDeinit() { }
}
