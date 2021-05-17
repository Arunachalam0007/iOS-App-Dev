//
//  WeatherTableViewCell.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 10/05/21.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    
    
    func setCellValue(vm: WeatherViewModel) {
        cityNameLable.text =  vm.cityName
        temperatureLable.text = vm.cityTemp?.formatAsDegree()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
