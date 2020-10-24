//
//  VacancyViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 24.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol VacancyViewInput: Loadable, AlertPresentable {
    func update(with viewModel: VacancyViewModel)
}

final class VacancyViewController: UIViewController {

    var presenter: VacancyViewOutput?
    
    private var viewModel: VacancyViewModel?
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
        presenter?.viewIsReady()
    }
    
    private func setupSubviews() {
        tableView.backgroundColor = UIColor(rgb: 0xE5E5E5)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellTypes: [VacancyCell.self])
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }

    private func setupNavigationBar() {
        let navBar = navigationController?.navigationBar
        navBar?.setWhiteStyle()
        navBar?.setTitleColor(color: .black)
        setCustomBackIcon()
        navigationItem.title = "Вакансии"
        let filterBarButton = UIBarButtonItem(image: UIImage(named: "filter"),
                                             style: .done,
                                             target: self,
                                             action: #selector(filterButtonTap(_:)))
        filterBarButton.setTitleTextAttributes([NSAttributedString.Key.link : link], for: .normal)
        filterBarButton.tintColor = Colors.grey
        navigationItem.rightBarButtonItem = filterBarButton
    }
    
    @objc private func filterButtonTap(_ sender: UIBarButtonItem) {
        presenter?.filterButtonClick()
    }
    
}


extension VacancyViewController: UITableViewDelegate {
    
}

extension VacancyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.rows.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.rows[indexPath.row] else {
            assertionFailure("Failed to init cell in \(className)")
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
    
}

extension VacancyViewController: VacancyViewInput {
    
    func update(with viewModel: VacancyViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }

}
