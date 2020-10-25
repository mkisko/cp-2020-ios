//
//  ViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol HomeViewInput: AlertPresentable, Loadable {
    func update(with viewModel: HomeViewModel)
}

final class HomeViewController: UIViewController {

    var tableView = UITableView()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSubviews()
        presenter?.viewIsReady()
    }

    // MARK: - Properties
    
    var presenter: HomeViewOutput?

    private var viewModel: HomeViewModel?
    
    private func setupSubviews() {
        tableView.backgroundColor = UIColor(rgb: 0xE5E5E5)
        tableView.separatorStyle = .none
        tableView.register(cellTypes: [HomeCell.self])
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    private func setupNavigationBar() {
        let navBar = navigationController?.navigationBar
        navBar?.setWhiteStyle()
        navBar?.setTitleColor(color: .black)
        navigationItem.title = "Мой путь"
        
    }
    
}


// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell()
    }
}


// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rows.count ?? 0
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


// MARK: - HomePresenterProtocol
extension HomeViewController: HomeViewInput {
    
    func update(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }

}
