//
//  AlertAction.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let action: (() -> Void)?
}

let AlertCancelAction = AlertAction(title: "Закрыть", style: .cancel, action: nil)
