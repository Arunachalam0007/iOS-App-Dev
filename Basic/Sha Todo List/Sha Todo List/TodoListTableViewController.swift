//
//  TodoListTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 12/04/21.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController {
    
   // var todoListArrayNames =  ["AK","Arun","Kalai"]
    
    var toDoListItems = [ToDoListItem]()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    // find the file path which is return URL FilePath
    let toDoPlistFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoList.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Load CoreData from Persistant container or Database
        fetchOrReadCoreDataToDoList()
                
        print("Current File Path",toDoPlistFilePath!)
        
        //Decode Existing Plist data from file path and append to TableView
       // getDecodeToDoItems()

    }
    
    
    @IBAction func addTodos(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todo item", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Todos", style:.default) { (alertAction) in
            
            if let alertTxtF = alert.textFields, let toDoText = alertTxtF[0].text {
                
                //Create TodoListItem CoreData class object and append to array
                let newToDoListItem = ToDoListItem(context: self.context)
                newToDoListItem.todoTitle = toDoText
                self.toDoListItems.append(newToDoListItem)
                
                self.saveCoreDatToDoList()
                
 
                //self.writeEncodeToDoListItems()
            }
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alerTextF) in
            alerTextF.placeholder = "Enter your Todo Name"
        }
        
        present(alert, animated: true)
        
    }
    
    
    func saveCoreDatToDoList(){
        do {
            try context.save()
        } catch  {
            print("Got Error While CoreData Context got Save : ",error)
        }
       tableView.reloadData()
    }
    
    // Fetch CoreData ToDoLitst with default Parameter value.
    func fetchOrReadCoreDataToDoList(with fRequest: NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest()) {
        
   
        do {
            self.toDoListItems = try context.fetch(fRequest)
        } catch {
            print("Error when Fetch the request from Core Data \(error)")
        }
        tableView.reloadData()
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
         
        toDoListItems[indexPath.item].done = !toDoListItems[indexPath.item].done

        // Delete the NSManagedObject to persistant Data
        // context.delete(toDoListItems[indexPath.row])
        // toDoListItems.remove(at: indexPath.row)
        
        
        // Update CoreData ToDoList
        saveCoreDatToDoList()
        
        // Deslect the table row
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}


extension TodoListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        
        let fRequest: NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest()
        
        // predicate is like Where Condition in Sql to make condition
        fRequest.predicate =  NSPredicate(format: "todoTitle CONTAINS[cd] %@", searchBar.text!)
       
        // SortDescriptor is use to sort the key based on asc and desc
        fRequest.sortDescriptors = [NSSortDescriptor(key: "todoTitle", ascending: true)]
        
        fetchOrReadCoreDataToDoList(with: fRequest)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            DispatchQueue.main.async {
                self.fetchOrReadCoreDataToDoList()
            }
        }
    }
    
}







//Set TodoListItem array value into UserDefault
//  UserDefaults.standard.setValue(self.todoListArrayNames, forKey: "TodoListItemArray")

//        if let toDoListNames = UserDefaults.standard.array(forKey: "TodoListItemArray") as? [String]  {
//            toDoListItems = toDoListNames
//        }


//    func getDecodeToDoItems() {
//
//        if let data = try? Data(contentsOf: toDoPlistFilePath!) {
//
//            let decode = PropertyListDecoder()
//            do {
//                toDoListItems = try decode.decode([TodoListItem].self, from: data)
//            } catch  {
//                print("Error while encoding Data \(error)")
//            }
//        }
//       tableView.reloadData()
//    }
//
//    func writeEncodeToDoListItems() {
//        let encode = PropertyListEncoder()
//        do {
//            let data = try encode.encode(self.toDoListItems)
//            try data.write(to: self.toDoPlistFilePath!)
//        }catch{
//            print("Error while encoding Data \(error)")
//        }
//        tableView.reloadData()
//    }
//
