//
//  SettingsTableViewController.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 11/05/21.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var settingsVM =  SettingsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func saveBtnPressed () {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Settings.settingsCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = settingsVM.settingsValue(index: indexPath.row)
        
        if cell.textLabel?.text == settingsVM.selectedUnit.displayName {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach{
            cell in
            cell.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        settingsVM.selectedUnit = settingsVM.units[indexPath.row]

    }
    

}
