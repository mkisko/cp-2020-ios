//
//  HomeCell.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    var backView = UIView()
    var fotoImageView = UIImageView()
    var courseLabel = UILabel()
    var checkImageView = UIImageView()
    var salaryLabel = UILabel()
    var salaryLevelLabel = UILabel()
//    var circleView = UIView()
    var vacancyCountLabel = UILabel()
    var vacancyStackView = UIStackView()
    
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
        backView.autoSetDimension(.height, toSize: 127)
        backView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        backView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        backView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        backView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)

        fotoImageView.contentMode = .scaleAspectFit
        fotoImageView.cornerRadius = 10
        fotoImageView.backgroundColor = .clear
        backView.addSubview(fotoImageView)
        fotoImageView.autoSetDimensions(to: CGSize(width: 36, height: 36))
        fotoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        fotoImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 14)


        courseLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        courseLabel.textColor = .black
        courseLabel.textAlignment = .left
        backView.addSubview(courseLabel)
        courseLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 19)
        courseLabel.autoPinEdge(.left, to: .right, of: fotoImageView, withOffset: 8)
        
        checkImageView.backgroundColor = .clear
        checkImageView.contentMode = .scaleAspectFit
        checkImageView.image = UIImage(named: "check")
        backView.addSubview(checkImageView)
        checkImageView.autoSetDimensions(to: CGSize(width: 24, height: 24))
        checkImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 17)
        checkImageView.autoPinEdge(toSuperviewEdge: .right, withInset: 12)

        courseLabel.autoPinEdge(.right, to: .left, of: checkImageView, withOffset: 10)

        

        salaryLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        salaryLabel.textColor = UIColor(rgb: 0x8F92A1)
        salaryLabel.textAlignment = .left
        salaryLabel.text = "Уровень зарплат"
        backView.addSubview(salaryLabel)
        salaryLabel.autoSetDimensions(to: CGSize(width: 150, height: 18))
        salaryLabel.autoPinEdge(.top, to: .bottom, of: fotoImageView, withOffset: 23)
        salaryLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 14)
        salaryLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        
        salaryLevelLabel.font = UIFont(name: "SFProText-Semibold", size: 15)
        salaryLevelLabel.textColor = .black
        backView.addSubview(salaryLevelLabel)
        salaryLevelLabel.autoSetDimensions(to: CGSize(width: 160, height: 15))
        salaryLevelLabel.autoPinEdge(.top, to: .bottom, of: salaryLabel, withOffset: 4)
        salaryLevelLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 14)
        salaryLevelLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
        
        
        
        vacancyCountLabel.font = UIFont(name: "SFProText-Regular", size: 8)
        vacancyCountLabel.textColor = .black
        vacancyCountLabel.adjustsFontSizeToFitWidth = true
        backView.addSubview(vacancyCountLabel)
        vacancyCountLabel.autoSetDimension(.width, toSize: 75)
        vacancyCountLabel.autoPinEdge(.top, to: .bottom, of: checkImageView, withOffset: 53)
        vacancyCountLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 14)
        vacancyCountLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15)
       
//        circleView.cornerRadius = 3
//        circleView.autoSetDimensions(to: CGSize(width: 6, height: 6))
//        circleView.backgroundColor = .black
//        backView.addSubview(circleView)
//        circleView.autoPinEdge(toSuperviewEdge: .top, withInset: 95, relation: .lessThanOrEqual)
//        circleView.autoPinEdge(.right, to: .left, of: vacancyCountLabel,withOffset: 4)
//        circleView.autoPinEdge(.left, to: .right, of: salaryLevelLabel)
//        circleView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 15, relation: .greaterThanOrEqual)
//        circleView.autoAlignAxis(.horizontal, toSameAxisOf: vacancyCountLabel)
        


        
        
        
       

    }
}


extension HomeCell: Configurable {
    
    typealias Model = HomeModel
    
    func configure(with model: Model) {
        courseLabel.text = model.course
        
        if model.status == 1 {
            checkImageView.isHidden = false
        } else {
            checkImageView.isHidden = true
        }
        
        switch model.id {
        case 5:
            fotoImageView.image = UIImage(named: "ava 2")
            
        case 6:
            fotoImageView.image = UIImage(named: "ava 1")
            
        default:
            fotoImageView.image = UIImage(named: "ava 3")
        }
        
        salaryLevelLabel.text = "\(model.salaryMin) - \(model.salaryMax) ₽"
        
        switch model.vacancyCount {
        case 1:
            vacancyCountLabel.text = "\(model.vacancyCount) вакансия"
            
        case 2,3,4:
            vacancyCountLabel.text = "\(model.vacancyCount) вакансии"

        case 0,5...:
            vacancyCountLabel.text = "\(model.vacancyCount) вакансий"
            
        default:
            vacancyCountLabel.text = "\(model.vacancyCount) вакансий"
        }
        
    }
    
}
