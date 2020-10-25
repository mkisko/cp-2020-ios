//
//  ProfileViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 25.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol ProfileViewInput: Loadable, AlertPresentable {
    
}

final class ProfileViewController: UIViewController {

    var presenter: ProfileViewOutput?
    
    private let scrollView = UIScrollView()
    
    private let infoView = UIView()
    private let headerLabel = UILabel()
    private let fotoImageView = UIImageView()
    private let fioLabel = UILabel()
    private let cityLabel = UILabel()
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Профиль"
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        
        
        infoView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.addSubview(infoView)
        infoView.autoSetDimension(.height, toSize: InterfaceUtils.screenHeight / 2)
        infoView.autoPinEdge(toSuperviewEdge: .top)
        infoView.autoPinEdge(toSuperviewEdge: .left)
        infoView.autoPinEdge(toSuperviewEdge: .right)
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 26)
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 0
        headerLabel.text = "Специалист по мониторингу"
        infoView.addSubview(headerLabel)
        headerLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 40)
        headerLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 29)
        headerLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 29)
        headerLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        fotoImageView.cornerRadius = 80
        fotoImageView.borderWidth = 2
        fotoImageView.borderColor = Colors.darkBlue
        fotoImageView.clipsToBounds = true

        fotoImageView.contentMode = .scaleAspectFill
        fotoImageView.image = UIImage(named: "foto")
        infoView.addSubview(fotoImageView)
        fotoImageView.autoSetDimensions(to: CGSize(width: 160, height: 160))
        fotoImageView.autoPinEdge(.top, to: .bottom, of: headerLabel, withOffset: 28)
        fotoImageView.autoAlignAxis(toSuperviewAxis: .vertical)
    }
}

extension ProfileViewController: ProfileViewInput {
    
}
