//
//  TableViewDataSource.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 13/05/21.
//

import Foundation
import UIKit

class TableViewDataSource<CellType,ViewModel> : NSObject,UITableViewDataSource where CellType:UITableViewCell  {
    
    var cellIdentifier: String
    var listVM: [ViewModel]
    var configureCell: (CellType,ViewModel) -> ()
    
     init(cellIdentifier:String, listVM: [ViewModel], callback: @escaping (CellType,ViewModel)-> ()) {
        self.cellIdentifier = cellIdentifier
        self.listVM = listVM
        self.configureCell = callback
    }
    
    func updateListVM(listVM: [ViewModel]) {
        self.listVM = listVM
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellType
        configureCell(cell,listVM[indexPath.row])
        return cell
    }
    
}
