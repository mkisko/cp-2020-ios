//
//  VacancyCell.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class VacancyCell: UITableViewCell {

    var backView = UIView()
    
    var homeImage = UIImageView()
    var companyNameLabel = UILabel()
    var cityLabel = UILabel()
    
    var titleLabel = UILabel()
    var typeLabel = UILabel()
    var costLabel = UILabel()
    
    var percentLabel = UILabel()
    var progressBar = UIProgressView()
    var questionButton = UIButton()
    var respondButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.backgroundColor = UIColor(rgb: 0xE5E5E5)
        self.selectionStyle = .none
        
        backView.backgroundColor = .white
        backView.cornerRadius = 8
        addSubview(backView)
        backView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        backView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        backView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        backView.autoPinEdge(toSuperviewEdge: .bottom)
        
        homeImage.image = UIImage(named: "home")
        homeImage.contentMode = .scaleAspectFit
        backView.addSubview(homeImage)
        homeImage.autoSetDimensions(to: CGSize(width: 16, height: 16))
        homeImage.autoPinEdge(toSuperviewEdge: .top,withInset: 13)
        homeImage.autoPinEdge(toSuperviewEdge: .left,withInset: 14)
        
        companyNameLabel.font = UIFont.boldSystemFont(ofSize: 13)
        companyNameLabel.textColor = Colors.grey
        companyNameLabel.textAlignment = .left
        companyNameLabel.numberOfLines = 1
        backView.addSubview(companyNameLabel)
        companyNameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 13)
        companyNameLabel.autoPinEdge(.left, to: .right, of: homeImage, withOffset: 6)
        
        cityLabel.font = UIFont.systemFont(ofSize: 12)
        cityLabel.textAlignment = .right
        cityLabel.textColor = Colors.grey
        cityLabel.adjustsFontSizeToFitWidth = true
        backView.addSubview(cityLabel)
        cityLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 13)
        cityLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        cityLabel.autoPinEdge(.left, to: .right, of: companyNameLabel, withOffset: 10)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 19)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        backView.addSubview(titleLabel)
        titleLabel.autoPinEdge(.top, to: .bottom, of: companyNameLabel, withOffset: 10)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 14)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 14)
        
        typeLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        typeLabel.textAlignment = .left
        typeLabel.textColor = Colors.grey
        backView.addSubview(typeLabel)
        typeLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 10)
        typeLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 14)
        typeLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 14)
        
        costLabel.font = UIFont.boldSystemFont(ofSize: 19)
        costLabel.textAlignment = .left
        costLabel.textColor = Colors.dark
        backView.addSubview(costLabel)
        costLabel.autoPinEdge(.top, to: .bottom, of: typeLabel, withOffset: 10)
        costLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 14)
        costLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 14)
        
        let progressLabel = UILabel()
        progressLabel.font = UIFont.boldSystemFont(ofSize: 13)
        progressLabel.textAlignment = .left
        progressLabel.text = "Соответствие вакансии"
        backView.addSubview(progressLabel)
        progressLabel.autoPinEdge(.top, to: .bottom, of: costLabel, withOffset: 17)
        progressLabel.autoPinEdge(toSuperviewEdge: .left,withInset: 16)
        
        percentLabel.font = UIFont.boldSystemFont(ofSize: 13)
        percentLabel.textAlignment = .right
        backView.addSubview(percentLabel)
        percentLabel.autoPinEdge(.top, to: .bottom, of: costLabel, withOffset: 17)
        percentLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 18)
        percentLabel.autoPinEdge(.left, to: .right, of: progressLabel, withOffset: 10)

        progressBar.progressViewStyle = .bar
        progressBar.trackTintColor = UIColor(red: 0.561, green: 0.573, blue: 0.631, alpha: 0.2)
        backView.addSubview(progressBar)
        progressBar.autoPinEdge(.top, to: .bottom, of: progressLabel)
        progressBar.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        progressBar.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        
        questionButton.backgroundColor = .clear
        questionButton.setTitle("Задать вопрос", for: .normal)
        questionButton.setTitleColor(Colors.dark, for: .normal)
        questionButton.cornerRadius = 4
        questionButton.borderWidth = 0.2
        questionButton.borderColor = Colors.grey
        
        respondButton.backgroundColor = .clear
        respondButton.setTitle("Откликнуться", for: .normal)
        respondButton.setTitleColor(Colors.dark, for: .normal)
        respondButton.cornerRadius = 4
        respondButton.borderWidth = 0.2
        respondButton.borderColor = Colors.grey
        
        let buttonsStackView = UIStackView()
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 0
        buttonsStackView.addArrangedSubview(questionButton)
        buttonsStackView.addArrangedSubview(respondButton)
        backView.addSubview(buttonsStackView)
        buttonsStackView.autoSetDimension(.height, toSize: 45)
        buttonsStackView.autoPinEdge(.top, to: .bottom, of: progressBar, withOffset: 20)
        buttonsStackView.autoPinEdge(toSuperviewEdge: .right)
        buttonsStackView.autoPinEdge(toSuperviewEdge: .left)
        buttonsStackView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
}

extension VacancyCell: Configurable {
    
    typealias Model = VacancyModel
    
    func configure(with model: VacancyModel) {
        
        companyNameLabel.text = model.company.title
        
        cityLabel.text = model.city
        
        titleLabel.text = model.title
        
        typeLabel.text = "Офис"
        
        costLabel.text = "\(model.maxCost) ₽"
        
        percentLabel.text = "\(model.progress) %"
        
        switch model.progress {
        case 75...100:
            progressBar.progressTintColor = UIColor(rgb: 0x1BC5BD)
            
        case 50...74:
            progressBar.progressTintColor = UIColor(rgb: 0xFFA800)
            
        case 25...49:
            progressBar.progressTintColor = UIColor(rgb: 0xED6262)
            
        default:
            progressBar.progressTintColor = UIColor(rgb: 0x000000)
        }
        progressBar.setProgress(Float(model.progress) / 100, animated: false)
        
    }
}
