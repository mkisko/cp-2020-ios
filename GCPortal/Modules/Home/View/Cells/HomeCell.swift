//
//  HomeCell.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet var fotoImageView: UIImageView!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var salaryLabel: UILabel!
    @IBOutlet var salaryLevelLabel: UILabel!
    @IBOutlet var circleView: UIView!
    @IBOutlet var vacancyCountLabel: UILabel!
    @IBOutlet var vacancyStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        fotoImageView.layer.cornerRadius = 10
        
        courseLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        courseLabel.textColor = .black
        
        salaryLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        salaryLabel.textColor = UIColor(rgb: 0x8F92A1)
        salaryLabel.text = "Уровень зарплат"
        
        salaryLevelLabel.font = UIFont(name: "SFProText-Semibold", size: 15)
        salaryLevelLabel.textColor = .black
        
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = 3
        
        vacancyCountLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        vacancyCountLabel.textColor = .black
    }
}


extension HomeCell: Configurable {
    
    struct Model {
        let course: String
        let isComplete: Bool
        let salary: String
        let vacancyCount: Int
    }
    
    func configure(with model: Model) {
        courseLabel.text = model.course
        
        if model.isComplete {
            checkImageView.isHidden = false
        } else {
            checkImageView.isHidden = true
        }
        
        salaryLevelLabel.text = model.salary
        
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
