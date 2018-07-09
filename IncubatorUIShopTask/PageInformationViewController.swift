//
//  PageInformationViewController.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 09.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class PageInformationViewController: UIViewController {

  @IBOutlet weak var usernameLabel: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  
  @IBOutlet weak var cityLabel: UILabel!
  
  @IBOutlet weak var balanceLabel: UILabel!

  
  func addNewInformation(username:String,city:String,balance:String){

    self.usernameLabel.text = username
    self.cityLabel.text = city 
    self.balanceLabel.text = balance
    
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if  segue.identifier == "pageSegue"{
      let destination = segue.destination as! ViewController
      destination.parentView = self
    }
  }

}
