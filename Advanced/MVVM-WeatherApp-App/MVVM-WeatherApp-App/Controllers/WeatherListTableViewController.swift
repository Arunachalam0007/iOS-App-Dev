//
//  WeatherListTableViewController.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UINib(nibName: K.Weather.weatherCellNibName, bundle: nil), forCellReuseIdentifier: K.Weather.weatherCellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Weather.weatherCellIdentifier, for: indexPath) as! WeatherCell
        
        cell.cityNameLable.text = "Chennai"
        cell.temperatureLable.text = "40°C"
        
        return cell
        
    }
    
}
