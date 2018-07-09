//
//  DetailViewController.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 05.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  var imageBanerData:[UIImage] = [#imageLiteral(resourceName: "kfc"),#imageLiteral(resourceName: "burgerK"),#imageLiteral(resourceName: "starbucks"),#imageLiteral(resourceName: "hut"),#imageLiteral(resourceName: "taco"),#imageLiteral(resourceName: "McDonalds"),#imageLiteral(resourceName: "donerKebab"),#imageLiteral(resourceName: "dodPizza")]
  
  @IBOutlet weak var imageBanerView: UIImageView!
  
  
  var foodDataArray = [AnyObject]()
  
  @IBOutlet weak var tableViewFood: UITableView!
  
  var navTitle: String?
  
  var id:Int!
  var url = "https://megaapi.herokuapp.com/api/food/id/"
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.navigationItem.title = navTitle
      
      
      imageBanerView.image = imageBanerData[id]
      load()
      
      
      
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func load(){
    Alamofire.request(url + String(id)).responseJSON { response in
      let result = response.result
      print(result)
      if let dict = result.value as? Dictionary<String,AnyObject>{
        print(dict)
        if let innerDict = dict["data"]{
          self.foodDataArray = innerDict as! [AnyObject]
          self.tableViewFood.reloadData()
          
        }
        
      }
      
    }
  }
  
 


}



extension DetailViewController{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foodDataArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "myDetailFoodCell", for: indexPath) as! DetailFoodCustomCell
    
    let foodName = foodDataArray[indexPath.row]["name"]
    let foodPrice = foodDataArray[indexPath.row]["price"]
    let foodChangePrice = foodPrice as! Int
    cell.foodDetailNameLabel.text = foodName as? String
    cell.foodDetailPriceLabel.text = String(foodChangePrice)
    if let imageUrl = foodDataArray[indexPath.row]["logoUrl"] as? String{
      Alamofire.request(imageUrl).responseImage { (response) in
        print(response)
        if let image = response.result.value{
          let size  = CGSize(width: 130, height: 130)
          let scaledImage = image.af_imageScaled(to: size)
          DispatchQueue.main.async {
            cell.foodDetailImage.image = scaledImage
            
          }
        }
      }
    }
    
    
    
    
    
    
    return cell
  }
  
  
  
}



