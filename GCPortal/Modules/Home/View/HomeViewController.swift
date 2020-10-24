//
//  ViewController.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol: AlertPresentable, Loadable {
    func update(with viewModel: HomeViewModel)
}

final class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter.viewIsReady()
    }

    // MARK: - Properties
    
    var presenter: HomePresenter {
        let presenter = HomePresenter()
        presenter.view = self
        return presenter
    }

    private var viewModel: HomeViewModel?
    
    private func setupSubviews() {
        tableView.separatorStyle = .none
        tableView.register(cellTypes: [HomeCell.self])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}


// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
    
}


// MARK: - HomePresenterProtocol
extension HomeViewController: HomePresenterProtocol {
    
    func update(with viewModel: HomeViewModel) {
        print(viewModel)
        self.viewModel = viewModel
        tableView.reloadData()
    }

}
