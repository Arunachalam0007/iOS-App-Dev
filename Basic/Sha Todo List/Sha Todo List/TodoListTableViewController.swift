//
//  TodoListTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 12/04/21.
//

import UIKit

class TodoListTableViewController: UITableViewController {
        
    var toDoListItems = [TodoListItem]()
    
    // find the file path which is return URL FilePath
    let toDoPlistFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoList.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Current File Path",toDoPlistFilePath!)
        
        //Decode Existing Plist data from file path and append to TableView
        getDecodeToDoItems()
        
        //        if let toDoListNames = UserDefaults.standard.array(forKey: "TodoListItemArray") as? [String]  {
        //            toDoListItems = toDoListNames
        //        }
    }
    
    func getDecodeToDoItems() {
        
        if let data = try? Data(contentsOf: toDoPlistFilePath!) {
            
            let decode = PropertyListDecoder()
            do {
                toDoListItems = try decode.decode([TodoListItem].self, from: data)
            } catch  {
                print("Error while encoding Data \(error)")
            }
        }
        tableView.reloadData()
    }
    
    func writeEncodeToDoListItems() {
        let encode = PropertyListEncoder()
        do {
            let data = try encode.encode(self.toDoListItems)
            try data.write(to: self.toDoPlistFilePath!)
        }catch{
            print("Error while encoding Data \(error)")
        }
        tableView.reloadData()
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
                //  UserDefaults.standard.setValue(self.todoListArrayNames, forKey: "TodoListItemArray")
                self.writeEncodeToDoListItems()
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
        writeEncodeToDoListItems()
        
    }
    
    
}
