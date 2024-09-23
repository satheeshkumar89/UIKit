//
//  ItemListViewController.swift
//  ImageCarouse
//
//  Created by APPLE on 23/09/24.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    var items: [String] = ["Apple", "Banana", "Orange", "Blueberry"]
    var filteredItems: [String] = []
    let tableView = UITableView()
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        filteredItems = items

        searchBar.delegate = self
        searchBar.placeholder = "Search"

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.tableHeaderView = searchBar
        tableView.frame = view.bounds
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.contains(searchText) }
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filteredItems[indexPath.row]
        return cell
    }
}
