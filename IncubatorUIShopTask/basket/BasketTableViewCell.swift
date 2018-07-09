//
//  BasketTableViewCell.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 08.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

  @IBOutlet weak var itemPrice: UILabel!
  @IBOutlet weak var itemQuantity: UILabel!
  @IBOutlet weak var itemName: UILabel!
  @IBOutlet weak var itemImage: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
