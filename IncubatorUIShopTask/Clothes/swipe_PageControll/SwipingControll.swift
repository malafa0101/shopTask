//
//  SwipingControll.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 07.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import Foundation
import UIKit
class SwipingControll: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIPickerViewDataSource,UIPickerViewDelegate{
  @IBOutlet weak var pageCollectionView: UICollectionView!
  
  @IBOutlet weak var pickerView: UIPickerView!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var nameBrandToppic: UILabel!
  var cloth:Cloth?
  @IBOutlet weak var viewBackPicker: UIView!
  
  var nameBrandsTitle:String?
  var clothCompanies:ClothCompany!
  override func viewDidLoad() {
    super.viewDidLoad()
    pageCollectionView.delegate = self
    pageCollectionView.dataSource = self
//    nameBrandToppic.text = nameBrandsTitle
  }
  
  
  let sizes:[String] = ["X","XL","M","S","XXL"]
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return sizes[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return sizes.count
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    textField.text = "\(sizes[row])"
    viewBackPicker.alpha = 0
  }
  
  @IBAction func pickerButton(_ sender: UIButton) {
    viewBackPicker.alpha = 1
    
  }
}


extension SwipingControll{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pageCell", for: indexPath) as! PageCVCell
    cell.pageImageView.load(fromUrl: (cloth?.logoUrl)!, complation: nil)
    cell.clothesNameLabel.text = cloth?.name
    
    
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
  }

}
