//
//  OrdersTableViewController.swift
//  MVVM-CCD-App
//
//  Created by ArunSha on 04/05/21.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var ordersVM: OrdersViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        loadOrders()
    }
    
    func loadOrders() {
        print("Loaded")
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("Order URL is INCorrect")
            return
        }
        OrderWebService().getOrders(url: url) { result in
            switch result {
            case .success(let orders):
                if let listOfOrders = orders as? [Order] {
                    self.ordersVM = OrdersViewModel(orders: listOfOrders)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            case .failure(let error):
                print("ERRORS",error)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ordersVM?.numberOfRowsInSection() ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersCell", for: indexPath)
        if let order = ordersVM?.orderAtIndex(index: indexPath.row) {
            cell.textLabel?.text = order.type
            cell.detailTextLabel?.text = order.size
        }
        return cell
    }
}
