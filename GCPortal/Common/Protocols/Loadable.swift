//
//  Loadable.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import NeatLayout

protocol Loadable {
    func showLoading()
    func hideLoading()
}

extension Loadable {
    func showLoading() {
        guard let `self` = self as? UIViewController else { return }
        let loadingView = UIView()
        loadingView.tag = loadingViewTag
        loadingView.backgroundColor = .white
        self.view.addSubview(loadingView)
        loadingView.autoPinEdgesToSuperviewEdges()
        let loadingIndicator = NVActivityIndicatorView(frame: .zero,
                                                       type: .circleStrokeSpin ,
                                                       color: .red)
        loadingView.addSubview(loadingIndicator)
        loadingIndicator.autoAlignAxis(toSuperviewAxis: .horizontal)
        loadingIndicator.autoAlignAxis(toSuperviewAxis: .vertical)
        loadingIndicator.autoSetDimensions(to: CGSize(width: 75, height: 50))
        loadingIndicator.startAnimating()
    }
    
    func hideLoading() {
        guard let `self` = self as? UIViewController else { return }
        guard let noInternetView = self.view.viewWithTag(loadingViewTag) else { return }
        noInternetView.removeFromSuperview()
    }
    
}

private let loadingViewTag = 12
