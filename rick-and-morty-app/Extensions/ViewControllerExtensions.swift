//
//  ViewControllerExtensions.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 10.09.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let chrctr = searchResponse?.results?[indexPath.row]
        cell.textLabel?.text = chrctr?.name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.results?.count ?? 0
    }

    // Set tableView
    func setTabelView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // Set searchBar
    func settingSearchBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
        navigationItem.searchController = searchController
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false, block: { _ in
            
            let targerUrl = Endpoints.BASE_URL + Page.character.rawValue
                + Param.name.rawValue
                + "\(searchText)"
                .replacingOccurrences(of: " ", with: "%20")
            
            self.networkDataFecther.fetchedCharacters(url: targerUrl, response: {[self] searchResponse in
                guard searchResponse != nil else {
                    return
                }
                self.searchResponse = searchResponse
                self.tableView.reloadData()
            })
        })
    }
}
