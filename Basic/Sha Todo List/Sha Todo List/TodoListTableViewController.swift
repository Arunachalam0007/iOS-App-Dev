//
//  TodoListTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 12/04/21.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    let nameItemArray =  ["AK","Arun","Kalai"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = nameItemArray[indexPath.item]
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let currentRow = tableView.cellForRow(at: indexPath)
        
        if currentRow?.accessoryType == .checkmark {
            currentRow?.accessoryType = .none
        } else {
            currentRow?.accessoryType = .checkmark
        }
        
    }
    
    
}
