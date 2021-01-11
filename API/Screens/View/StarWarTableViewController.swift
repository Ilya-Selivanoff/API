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
        
            setupTableCell()
               
           fetchData()
       }
           
           private func fetchData() {
               StarWarManager.shared.fetchStarWar(byPage: 1) { [unowned self] (resultsModel: [StarWarResult]?) in
                   guard let StarWarModels = resultsModel else {
                       return
                   }
                   
                   for model in StarWarModels {
                       addOrUpdateDataToDatabase(with: model)
                   }
                   
                   let realmStarWar: [StarWarRealmModel] = DatabaseManager.shared.fetch()
                   let starWar: [StarWarResult] = realmStarWar.map { StarWarResult(realmModel: $0) }

                   self.starWar = starWar
                   self.tableView.reloadData()
               }
           }
           
           private func addOrUpdateDataToDatabase(with model: StarWarResult) {
               let starWarRealmModel: StarWarRealmModel = {
                   let realmModel = StarWarRealmModel()
                   
                   realmModel.name = model.name ?? ""
                   realmModel.height = model.height ?? ""
                   realmModel.mass = model.mass ?? ""
                   realmModel.hairColor = model.hairColor ?? ""
                   realmModel.skinColor = model.skinColor ?? ""
                   realmModel.eyeColor = model.eyeColor ?? ""
                   realmModel.birthYear = model.birthYear ?? ""
                   realmModel.gender = model.gender ?? ""
                   realmModel.homeworld = model.homeworld ?? ""
                   realmModel.created = model.created ?? ""
                   realmModel.edited = model.edited ?? ""
                   realmModel.url = model.url ?? ""
                   
                   return realmModel
               }()
               
               DatabaseManager.shared.add(starWarRealmModel)
           }
           
           private func setupTableCell() {
               tableView.register(StarWarTableViewCell.nib, forCellReuseIdentifier: StarWarTableViewCell.cellId)
           }

           // MARK: - Table view data source
           override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return starWar.count
           }

           override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               guard let cell = tableView.dequeueReusableCell(withIdentifier: StarWarTableViewCell.cellId, for: indexPath) as? StarWarTableViewCell else {
                   return UITableViewCell()
               }
            
               cell.configure(with: starWar[indexPath.row])
               
               return cell
           }
       }
