//
//  CategoryTableViewController.swift
//  Sha Todo List
//
//  Created by ArunSha on 19/04/21.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    
    var realm = try! Realm()
    var toDoCategories: Results<ToDoCategory>?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        readOrFeatchRealmData()
    }
    
    // MARK: - Create ToDoCategory to Realm DB

    func saveRealmData(toDoCategory: ToDoCategory) {
        do {
            try realm.write{
                realm.add(toDoCategory)
            }
        } catch  {
            print("Error While Saving Data to Realm \(error)")
        }
        tableView.reloadData()
    }
    
    // MARK: - Fetch or Read ToDoCategory from Realm DB

    func readOrFeatchRealmData() {
        // objects return Results<> Objects.
        toDoCategories = realm.objects(ToDoCategory.self)
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoCategories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell",for: indexPath)
        cell.textLabel?.text = toDoCategories?[indexPath.row].name
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    // MARK: - Passing ToDoCategory to TodoListTableViewController

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toDoListTableVC = segue.destination as! TodoListTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
           let toDoCetegory = toDoCategories?[indexPath.item]
            toDoListTableVC.parentCategory = toDoCetegory
        }
    }
    
    
    // MARK: - BarButton (Add ToDoCategory)

    @IBAction func addCategoryToDoList(_ sender: UIBarButtonItem) {
        let alertVC = UIAlertController(title: "Add Your TodoList Category", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Add ToDos Category", style: .default) { (action) in
            if let alertTextFields = alertVC.textFields, let alertTextFValue = alertTextFields[0].text {
                if alertTextFValue.count > 0 {
                    let toDoCategory = ToDoCategory()
                    toDoCategory.name = alertTextFValue
                    self.saveRealmData(toDoCategory: toDoCategory)
                }
            }
        }
        alertVC.addTextField { (textFiled) in
            textFiled.placeholder = "Add Your ToDoList Category"
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }
    
}
