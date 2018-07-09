//
//  ClothesTableViewController.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 06.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ClothesTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
  
  
  let URL_REQEUST = "https://megaapi.herokuapp.com/api/cloth"
  @IBOutlet weak var clothesTableView: UITableView!
  var clothesCompanyDataArray = [ClothCompany]()


  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadData()
    
    
    // Do any additional setup after loading the view.
  }
  
  
  
  
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let destination = segue.destination as! ClothesDetailViewController
      destination.companyId = clothesCompanyDataArray[(clothesTableView.indexPathForSelectedRow?.row)!].id
//      destination.brandName = clothesCompanyDataArray[(clothesTableView.indexPathForSelectedRow?.row)!].name
      
  }
}

extension ClothesTableViewController{
  
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let stroryboard = UIStoryboard(name: "Main", bundle: nil)
//    let dvc = stroryboard.instantiateViewController(withIdentifier: "clothesID") as! ClothesDetailViewController
//    let value = clothesCompanyDataArray[indexPath.row]
//    dvc.companyId = value.id
//    dvc.titlees = clothesCompanyDataArray[indexPath.row].name!
//    self.navigationController?.pushViewController(dvc, animated: true)
//
//  }
//
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return clothesCompanyDataArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "clothesCell", for: indexPath) as! ClothesViewCell
    
    
    let clothCompanes = clothesCompanyDataArray[indexPath.row]
    if let imageUrl = clothCompanes.logoUrl{
      cell.clothesImageView?.load(fromUrl: imageUrl, complation: nil)
    }
    return cell
  }
  
  
  private func loadData(){
    Alamofire.request(URL_REQEUST).responseJSON { response in
      let result = response.result
      if let dict = result.value as? Dictionary<String,AnyObject>{
        if let innerDict = dict["data"] as? [AnyObject]{
          for data in innerDict{
            self.clothesCompanyDataArray.append(self.from(data:data))
          }
          self.clothesTableView.reloadData()
          
          
        }
      }
    }
  }
  
  
  private func from(data: AnyObject) -> ClothCompany{
    let clothCompany = ClothCompany()
    clothCompany.id = data["id"] as? Int
    clothCompany.name = data["name"] as? String
    clothCompany.logoUrl = data["logoUrl"] as? String
    return clothCompany
  }
  
  
  
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

