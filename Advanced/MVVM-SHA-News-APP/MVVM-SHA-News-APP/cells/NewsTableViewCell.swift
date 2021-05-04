//
//  NewsTableViewCell.swift
//  MVVM-SHA-News-APP
//
//  Created by ArunSha on 03/05/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle : UILabel!
    @IBOutlet weak var newsDescription : UILabel!
    @IBOutlet weak var newsImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
