//
//  TableViewController.swift
//  CoreDataPerson
//
//  Created by daicudu on 1/21/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        DataService.shared.selectedIndexPath = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        DataService.shared.selectedIndexPath = tableView.indexPathForSelectedRow
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.shared.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let person1 = DataService.shared.people[indexPath.row]
        if let avatarData = person1.avatar, let image = UIImage(data: avatarData) {
            cell.avartarImage.image =  image
        }
        cell.nameLabel.text = person1.name
        cell.ageLabel.text = String(person1.age)
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataService.shared.remove(at: indexPath, in: tableView)
            // Delete the row from the data source
        }
    }
    
}
