//
//  FilterVeiw.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class FilterView: UIView {
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    private let separatorView = UIView()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.backgroundColor = .white
        
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = Colors.grey
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        titleLabel.autoPinEdge(toSuperviewEdge: .top)
        titleLabel.autoPinEdge(toSuperviewEdge: .left)
        titleLabel.autoPinEdge(toSuperviewEdge: .right)
        
        valueLabel.font = UIFont.boldSystemFont(ofSize: 17)
        valueLabel.textColor = Colors.dark
        valueLabel.textAlignment = .left
        addSubview(valueLabel)
        valueLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 8)
        valueLabel.autoPinEdge(toSuperviewEdge: .left)
        valueLabel.autoPinEdge(toSuperviewEdge: .right)
        
        separatorView.backgroundColor = Colors.grey
        addSubview(separatorView)
        separatorView.autoSetDimension(.height, toSize: 1)
        separatorView.autoPinEdge(.top, to: .bottom, of: valueLabel, withOffset: 10)
        separatorView.autoPinEdge(toSuperviewEdge: .left)
        separatorView.autoPinEdge(toSuperviewEdge: .right)
        separatorView.autoPinEdge(toSuperviewEdge: .bottom)
    }
}

extension FilterView: Configurable {
    
    struct Model {
        let title: String
        let value: String
        let tap: UIGestureRecognizer
    }
    
    func configure(with model: Model) {
        titleLabel.text = model.title
        valueLabel.text = model.value
        valueLabel.addGestureRecognizer(model.tap)
    }
}
