//
//  FilterViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import MultiSlider

protocol FilterViewInput: Loadable, AlertPresentable {
    
}

final class FilterViewController: UIViewController {

    var presenter: FilterViewOutput?
    private var fractionSize = "%.2f"
    
    private var salaryLabel = UILabel()
    
    private var sliderBox = UIView()
    private var slider = MultiSlider()
    
    private let cityView = FilterView()
    private let requirementsLabel = UILabel()
    private let expView = FilterView()
    private let employTypeView = FilterView()
    private let scheduleView = FilterView()
    
    private let continueButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Поиск"
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        salaryLabel.font = UIFont.boldSystemFont(ofSize: 13)
        salaryLabel.textColor = Colors.dark
        salaryLabel.textAlignment = .left
        salaryLabel.text = "Зарплата:"
        view.addSubview(salaryLabel)
        salaryLabel.autoSetDimension(.height, toSize: 17)
        salaryLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 15)
        salaryLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        salaryLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        view.addSubview(sliderBox)
        sliderBox.autoPinEdge(.top, to: .bottom, of: salaryLabel, withOffset: 30)
        sliderBox.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        sliderBox.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        sliderBox.autoSetDimension(.height, toSize: 28)
        
        slider.isVertical = false
        slider.valueLabelPosition = .top
        
        slider.thumbCount = 2
        slider.snapStepSize = 5000
        slider.isHapticSnap = true
        slider.valueLabelPosition = .topMargin
        slider.minimumValue = 20000
        slider.maximumValue = 150000
        slider.distanceBetweenThumbs = 5000
        slider.value = [20000, 100000]
        slider.valueLabelFormatter.positiveSuffix = " ₽"
        slider.orientation = .horizontal
        slider.trackWidth = 4
        slider.outerTrackColor = Colors.grey
        slider.tintColor = Colors.darkBlue
        slider.addTarget(self, action: #selector(thumbDragging), for: .valueChanged)
        slider.addTarget(self, action: #selector(thumbDraggingFinished), for: .touchUpInside)
        sliderBox.addSubview(slider)
        slider.autoPinEdgesToSuperviewEdges()
        
        let cityTap = UITapGestureRecognizer(target: self, action: #selector(cityTapped))
        cityTap.numberOfTouchesRequired = 1
        cityView.configure(with: FilterView.Model(title: "Город:", value: "Ставрополь", tap: cityTap))
        view.addSubview(cityView)
//        cityView.autoSetDimension(.height, toSize: 49)
        cityView.autoPinEdge(.top, to: .bottom, of: sliderBox, withOffset: 35)
        cityView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        cityView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        requirementsLabel.font = UIFont.boldSystemFont(ofSize: 13)
        requirementsLabel.textAlignment = .left
        requirementsLabel.textColor = Colors.dark
        requirementsLabel.text = "Требования:"
        view.addSubview(requirementsLabel)
        requirementsLabel.autoPinEdge(.top, to: .bottom, of: cityView, withOffset: 20)
        requirementsLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        requirementsLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        let expTap = UITapGestureRecognizer(target: self, action: #selector(expTapped))
        expTap.numberOfTouchesRequired = 1
        expView.configure(with: FilterView.Model(title: "Требуемый опыт:", value: "1-2 семестр", tap: expTap))
        view.addSubview(expView)
        expView.autoPinEdge(.top, to: .bottom, of: requirementsLabel, withOffset: 6)
        expView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        expView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        let employTypeTap = UITapGestureRecognizer(target: self, action: #selector(employTapped))
        employTypeTap.numberOfTouchesRequired = 1
        employTypeView.configure(with: FilterView.Model(title: "Тип занятости:", value: "Частичная", tap: employTypeTap))
        view.addSubview(employTypeView)
        employTypeView.autoPinEdge(.top, to: .bottom, of: expView, withOffset: 6)
        employTypeView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        employTypeView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        let scheduleTypeTap = UITapGestureRecognizer(target: self, action: #selector(scheduleTapped))
        scheduleTypeTap.numberOfTouchesRequired = 1
        scheduleView.configure(with: FilterView.Model(title: "График работы:", value: "Удаленно", tap: employTypeTap))
        view.addSubview(scheduleView)
        scheduleView.autoPinEdge(.top, to: .bottom, of: expView, withOffset: 6)
        scheduleView.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        scheduleView.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        
        continueButton.setTitle("Применить", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = Colors.darkBlue
        continueButton.cornerRadius = 8
        continueButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(continueButton)
        continueButton.autoPinEdge(.top, to: .bottom, of: scheduleView, withOffset: 6, relation: .greaterThanOrEqual)
        continueButton.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        continueButton.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        continueButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 60)
    }
    
    
    // MARK: -  Actions
    
    @objc private func thumbDragging() {
        
        
    }
    
    @objc private func thumbDraggingFinished() {
        
        
    }
    
    @objc private func buttonClick() {
        presenter?.buttonTapped()
    }
    
    @objc private func cityTapped() {
        
    }
    
    @objc private func expTapped() {
        
    }
    
    @objc private func employTapped() {
        
    }
    
    @objc private func scheduleTapped() {
        
    }
    
}

extension FilterViewController: FilterViewInput {
    
}
