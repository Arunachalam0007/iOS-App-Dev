//
//  TodoListTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 12/04/21.
//

import UIKit
import RealmSwift

class TodoListTableViewController: UITableViewController {
    
    
    var toDoListItems: Results<ToDoListItem>?
    var realm = try! Realm()
    
    var parentCategory: ToDoCategory? {
        didSet{
            fetchRealmToDoListItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Fetch or Read ToDoList Item from Category Realm DB
    
    func fetchRealmToDoListItems() {
        // Fetch List of ToDoItems from Parent Relationship (Category)
        toDoListItems = parentCategory?.toDOListItem.sorted(byKeyPath: "itemCreatedDate", ascending: true)
    }
    
    
    // MARK: - Append ToDoListItem to Category Realm DB
    
    @IBAction func addTodos(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todo item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Todos", style:.default) { (alertAction) in
            
            if let alertTxtF = alert.textFields, let toDoText = alertTxtF[0].text {
                
                if toDoText.count > 0 {
                    if let currentCategory = self.parentCategory {
                        do {
                            try self.realm.write{
                                let newToDoListItem = ToDoListItem()
                                newToDoListItem.todoTitle = toDoText
                                newToDoListItem.itemCreatedDate = Date()
                                // Inverser Relationship to append new todolist to parent Container
                                currentCategory.toDOListItem.append(newToDoListItem)
                            }
                        } catch  {
                            print("Error While add T")
                        }
                    }
                }
                self.tableView.reloadData()
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
        toDoListItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = toDoListItems?[indexPath.item].todoTitle
        cell.accessoryType = (toDoListItems?[indexPath.item].done)! ? .checkmark : .none
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // MARK: - Update TodoItem Realm Database
        
        if let toDoItem = toDoListItems?[indexPath.row] {
            do {
                try realm.write{
                    toDoItem.done = !toDoItem.done
                }
            } catch {
                print("Error while updating the value in Realm ToDoListITEM \(error)")
            }
        }
        tableView.reloadData()
        
        // Deslect the table row
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}

// MARK: - SearchBar Delegate

extension TodoListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // MARK: - Fetch ToDoItems using filter condition
        
        let predicate = NSPredicate(format: "todoTitle CONTAINS[cd] %@", searchBar.text!)
        toDoListItems =  toDoListItems?.filter(predicate).sorted(byKeyPath: "todoTitle", ascending: true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            DispatchQueue.main.async {
                self.fetchRealmToDoListItems()
                self.tableView.reloadData()
                searchBar.resignFirstResponder()
                
            }
        }
    }
    
}
