//
//  TodoListTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 12/04/21.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    var todoListArrayNames =  ["AK","Arun","Kalai"]
    
    var toDoListItems = [TodoListItem]()

    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Current File Path",filePath)
        
        //Initialise or add the default value to TodoListItems
        
        let todoItem1 = TodoListItem()
        todoItem1.todoTitle = "WakeUp"
        todoItem1.done = true
        
        let todoItem2 = TodoListItem()
        todoItem2.todoTitle = "Bath"
        
        let todoItem3 = TodoListItem()
        todoItem3.todoTitle = "Standup"
        todoItem3.done = true
        
        let todoItem4 = TodoListItem()
        todoItem4.todoTitle = "iOS"
        
        toDoListItems.append(todoItem1)
        toDoListItems.append(todoItem2)
        toDoListItems.append(todoItem3)
        toDoListItems.append(todoItem4)
        
//
//        if let toDoListNames = UserDefaults.standard.array(forKey: "TodoListItemArray") as? [TodoListItem]  {
//            toDoListItems = toDoListNames
//        }
    }
    
    
    @IBAction func addTodos(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todo item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Todos", style:.default) { (alertAction) in
            
            if let alertTxtF = alert.textFields, let toDoText = alertTxtF[0].text {
                //Create TodoListItem class object and append to array
                let newToDoListItem = TodoListItem()
                newToDoListItem.todoTitle = toDoText
                self.toDoListItems.append(newToDoListItem)
                
                //Set TodoListItem array value into UserDefault
                UserDefaults.standard.setValue(self.todoListArrayNames, forKey: "TodoListItemArray")
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
        toDoListItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = toDoListItems[indexPath.item].todoTitle
        cell.accessoryType = toDoListItems[indexPath.item].done ? .checkmark : .none
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
      // let currentRow = tableView.cellForRow(at: indexPath)
        
        toDoListItems[indexPath.item].done = !toDoListItems[indexPath.item].done
        DispatchQueue.main.async {
            tableView.reloadData()
        }
        
    }
    
    
}
