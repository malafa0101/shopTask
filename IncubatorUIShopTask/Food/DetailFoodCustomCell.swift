//
//  DetailFoodCustomCell.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 05.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class DetailFoodCustomCell: UITableViewCell {

  @IBOutlet weak var spentLabel: UILabel!
  @IBOutlet weak var viewCell: UIView!
  @IBOutlet weak var foodDetailPriceLabel: UILabel!
  @IBOutlet weak var foodDetailNameLabel: UILabel!
  @IBOutlet weak var foodDetailImage: UIImageView!
  @IBOutlet weak var spentView: UIView!
  var label = 0
  override func awakeFromNib() {
        super.awakeFromNib()
    
      spentView.layer.masksToBounds = true
      spentView.layer.cornerRadius = 10
   
      self.viewCell.layer.masksToBounds = true 
      self.viewCell.layer.cornerRadius = 20
    
        // Initialization code
    }
  
  
  @IBAction func spentMinus(_ sender: UIButton) {
    if label>0{
    label = label - 1
    spentLabel.text = String(label)
    }
    
  }
  
  @IBAction func spentPlus(_ sender: UIButton) {
    
    label = label + 1
    spentLabel.text = String(label)
  }
 
  
  func appendBasket(){
    
    
  }
  
  
  
}
