//
//  ViewController.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 08.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Create search controller
    let searchController = UISearchController(searchResultsController: nil)
    var network = Network()
    var searchResponse: SearchResponse? = nil
    var timer: Timer?
    
    // Create table view
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        settingSearchBar()
        setTabelView()
        setConstraints()
        
//        var urlForSearch = "https://rickandmortyapi.com/api/character/?name=Rick%20Sanchez"
//        network.request(url: Endpoints.BASE_URL + Page.character.rawValue + "\(searchText)") { [weak self] result in
//            switch result {
//            case .success(let response):
//                self?.searchResponse = response
//                self?.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

// MARK: - extension for constraints
extension ViewController {
    
    // Set consntraints
    func setConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
    }
}
