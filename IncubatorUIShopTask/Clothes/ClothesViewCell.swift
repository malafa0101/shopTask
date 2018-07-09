//
//  ClothesViewCell.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 06.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class ClothesViewCell: UITableViewCell {

  @IBOutlet weak var clothesImageView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  @IBOutlet weak var tableViews: UIView!
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    tableViews.layer.masksToBounds = true
    tableViews.layer.cornerRadius = 35

        // Configure the view for the selected state
    }

}
