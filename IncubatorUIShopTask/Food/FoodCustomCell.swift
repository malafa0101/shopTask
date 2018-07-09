//
//  FoodCustomCell.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 04.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit
import Kingfisher

class FoodCustomCell: UITableViewCell {

 
  @IBOutlet weak var foodImageView: UIImageView!
  @IBOutlet weak var foodDescribeLabel: UILabel!
  @IBOutlet weak var foodNameLabel: UILabel!
  @IBOutlet weak var foodAveragePrice: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    
    }

 
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  
  

}
