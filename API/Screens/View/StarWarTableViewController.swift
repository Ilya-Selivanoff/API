//
//  StarWarTableViewController.swift
//  API
//
//  Created by Илья Селиванов  on 26.12.2020.
//

import UIKit

class StarWarTableViewController: UITableViewController {
        
    private var starWar = [StarWarResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarManager.shared.fetchStarWar(byPage: 1) { [unowned self] (model: [StarWarResult]?) in
            guard let starWar = model else {
                return
            }
            
            self.starWar = starWar
            self.tableView.reloadData()
        }
        
        tableView.register(StarWarViewCell.nib, forCellReuseIdentifier: StarWarViewCell.cellId)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWar.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StarWarViewCell.cellId, for: indexPath) as? StarWarViewCell, let name = starWar[indexPath.row].name else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = name
        
        return cell
    }
    
}
