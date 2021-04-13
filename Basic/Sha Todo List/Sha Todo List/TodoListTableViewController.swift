//
//  TodoListTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 12/04/21.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    var todoListArrayNames =  ["AK","Arun","Kalai"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDoListNames = UserDefaults.standard.array(forKey: "TodoListArray") as? [String]  {
            todoListArrayNames = toDoListNames
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func addTodos(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todo item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Todos", style:.default) { (alertAction) in
            
            if let alertTxtF = alert.textFields, let toDoText = alertTxtF[0].text {
                self.todoListArrayNames.append(toDoText)
                UserDefaults.standard.setValue(self.todoListArrayNames, forKey: "TodoListArray")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alerTextF) in
            alerTextF.placeholder = "Enter your Todo Name"
        }
        
        present(alert, animated: true)
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoListArrayNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = todoListArrayNames[indexPath.item]
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
