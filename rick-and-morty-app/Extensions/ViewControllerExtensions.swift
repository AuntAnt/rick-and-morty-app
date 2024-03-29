//
//  ViewControllerExtensions.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 10.09.2022.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CharacterTableCell else { fatalError() }
        
        let character = searchResponse?.results?[indexPath.row]
        
        if let character = character {
            cell.setupCell(character)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let character = searchResponse?.results?[indexPath.row]
        
        if let character = character {
            self.navigationController?.pushViewController(AboutCharacterViewController(character: character), animated: true)
        }
    }

    // MARK: - Set tableView
    func setTabelView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterTableCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Set searchBar
    func settingSearchBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Characters"
        navigationItem.searchController = searchController
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false, block: { _ in
            
            let targerUrl = Constants.baseUrl + Constants.characterPage
                + Constants.searchNameParam
                + "\(searchText)"
                .replacingOccurrences(of: " ", with: "%20")
            
            self.networkDataFetcher.fetchedCharacters(url: targerUrl, response: {[self] searchResponse in
                guard searchResponse != nil else {
                    return
                }
                self.searchResponse = searchResponse
                self.tableView.reloadData()
            })
        })
    }
}
