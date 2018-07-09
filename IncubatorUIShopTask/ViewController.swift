//
//  ViewController.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 04.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
  @IBOutlet weak var textFPickerView: UITextField!
  
  @IBOutlet weak var balanceTextF: UITextField!
  @IBOutlet weak var usernameTextF: UITextField!
  @IBOutlet weak var viewPickerView: UIView!
  @IBOutlet weak var pickerVIew: UIPickerView!
  var parentView:PageInformationViewController?
  var pickerValue:String?
  
  
  let city:[String] = ["Almaty","Aktau","Astana","Kizilorda","Karaganda","Atyrau"]
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    return city[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return city.count
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    textFPickerView.text = "\(city[row])"
    pickerValue = city[row]
    viewPickerView.alpha = 0
  }
 
  
  
  @IBAction func saveButton(_ sender: UIButton) {
  
    parentView?.addNewInformation(username: usernameTextF.text!, city: pickerValue!, balance: balanceTextF.text!)
    
  }
  
  
  @IBAction func selectedPhoto(_ sender: Any) {
    
    let image = UIImagePickerController()
    image.delegate = self
    image.sourceType = UIImagePickerControllerSourceType.photoLibrary
    image.allowsEditing = false
    
    self.present(image,animated: true)
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
    }else{
      //Error
    }
    
    self.dismiss(animated: true, completion: nil)
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  

  @IBAction func buttonPicker(_ sender: UIButton) {
    viewPickerView.alpha = 1
    
    
    
  }
  
  
  
  
  
  

}

