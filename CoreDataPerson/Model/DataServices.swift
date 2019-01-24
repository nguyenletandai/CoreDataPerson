//
//  DataServices.swift
//  CoreDataPerson
//
//  Created by daicudu on 1/24/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit

class DataService {
    static let shared = DataService()
   
    var people: [Person]! = []
    var selectedIndexPath: IndexPath? {
        didSet {
            guard let indexPath = selectedIndexPath else {return}
            selectedPerson = people[indexPath.row]
        }
    }
    var selectedPerson : Person?
    init()  {
        people = try? (AppDelegate.context.fetch(Person.fetchRequest())) as [Person]
    }
  
    func remove(at indexPath: IndexPath, in tableView: UITableView) {
        AppDelegate.context.delete(people[indexPath.row])
        people.remove(at: indexPath.row)
        AppDelegate.saveContext()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func insert(person: Person, at indexPath: IndexPath, in tableView: UITableView?) {
        people.append(person)
        tableView?.insertRows(at: [indexPath], with: .fade)
    }
    
    func edit(name: String?, ageString: String?, image: UIImage?) {
        selectedPerson?.name = name
        selectedPerson?.age = Int64(ageString ?? "") ?? 0
        selectedPerson?.avatar = image?.pngData()
        AppDelegate.saveContext()

    }
    func createPerson(name: String?, ageString: String?, image: UIImage?, in tableView: UITableView? = nil) {
        let person = Person(name: name, ageText: ageString, image: image)
        insert(person: person, at: IndexPath(row: 0, section: 0), in: tableView)
        AppDelegate.saveContext()
    }
}
