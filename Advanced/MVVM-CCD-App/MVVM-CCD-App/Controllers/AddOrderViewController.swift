//
//  AddOrderViewController.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 04/05/21.
//

import UIKit

class AddOrderViewController: UIViewController {

    @IBOutlet weak var coffeeTableView: UITableView!
    @IBOutlet weak var orderName: UITextField!
    
    @IBOutlet weak var orderEmail: UITextField!
    
    var coffeeSegmentControl: UISegmentedControl!
    
    var addCoffeeViewModel = AddCoffeeOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func closeBtnPressed(_ sender: UIBarButtonItem) {
        
        // How to go to root view controller
        
        
        var orderVC = OrdersTableViewController()
        var addOrderVC = AddOrderViewController()
        navigationController?.show(orderVC, sender: self)
       // navigationController?.puss(animated: true)
      //  navigationController?.pushViewController(orderVC, animated: true)
//        addOrderVC.dismiss(animated: true) {
//            "DisMissed"
//        }
    }
    
    @IBAction func saveBtnPressed (_ sender: UIBarButtonItem) {
        addCoffeeViewModel.name = orderName.text
        addCoffeeViewModel.email = orderEmail.text
        addCoffeeViewModel.selectedCoffeeSize = coffeeSegmentControl.titleForSegment(at: coffeeSegmentControl.selectedSegmentIndex)
        addCoffeeViewModel.selectedCoffeeType =  addCoffeeViewModel.type[ coffeeTableView.indexPathForSelectedRow?.row ?? 0 ]
        
        print(addCoffeeViewModel.name, " Type: ",addCoffeeViewModel.selectedCoffeeType," Size: ",addCoffeeViewModel.selectedCoffeeSize)
        
    }
    
    func uiSetup() {
        self.coffeeSegmentControl = UISegmentedControl(items: addCoffeeViewModel.size)
        self.view.addSubview(coffeeSegmentControl!)
        // We must set AutoSizing to False for Setting new autosizing
        coffeeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        coffeeSegmentControl.topAnchor.constraint(equalTo: self.coffeeTableView.bottomAnchor, constant: 70).isActive = true
        coffeeSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        coffeeSegmentControl.selectedSegmentIndex = 0
    }
}

extension AddOrderViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCoffeeViewModel.type.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath)
        cell.textLabel?.text = addCoffeeViewModel.type[indexPath.row]
        return cell
    }
    
    
}

extension AddOrderViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
