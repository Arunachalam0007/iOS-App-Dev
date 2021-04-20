//
//  CategoryTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 19/04/21.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var toDoCategories = [ToDoCategory]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoList.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readOrFetchCategoryToDoList()
    }
    
    func saveCategoryToDoList() {
        do {
            try context.save()
            print("Categories Saved")
        } catch{
            print("Error while in Save Context \(error)")
        }
        tableView.reloadData()
    }
    
    
    func readOrFetchCategoryToDoList() {
        let fetchReq: NSFetchRequest<ToDoCategory> = ToDoCategory.fetchRequest()
        do {
            toDoCategories = try context.fetch(fetchReq)
        } catch {
            print("Eroor while in fetch OR Read Context \(error)")
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell",for: indexPath)
        cell.textLabel?.text = toDoCategories[indexPath.row].name
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toDoListTableVC = segue.destination as! TodoListTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
           let toDoCetegory = toDoCategories[indexPath.item]
            toDoListTableVC.parentCategory = toDoCetegory
        }
    }
    
    
    
    @IBAction func addCategoryToDoList(_ sender: UIBarButtonItem) {
        print("Bar Button Got Pressed")
        let alertVC = UIAlertController(title: "Add Your TodoList Category", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add ToDos Category", style: .default) { (action) in
            if let alertTextFields = alertVC.textFields, let alertTextFValue = alertTextFields[0].text {
                let toDoCategory = ToDoCategory(context: self.context)
                toDoCategory.name = alertTextFValue
                self.toDoCategories.append(toDoCategory)
                self.saveCategoryToDoList()
            }
        }
        alertVC.addTextField { (textFiled) in
            textFiled.placeholder = "Add Your ToDoList Category"
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }
    
}
