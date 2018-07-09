import UIKit
import Alamofire

class FoodCompanyTableViewController: UITableViewController {
  
  private let URL_REQEST = "https://megaapi.herokuapp.com/api/food"
  private var foodCompanyList = [FoodCompany]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  private func loadData() {
    Alamofire.request(URL_REQEST).responseJSON { response in
      let result = response.result
      if let dict = result.value as? Dictionary<String,AnyObject>{
        if let dataList = dict["data"] as? [AnyObject] {
          for data in dataList {
            self.foodCompanyList.append(self.from(data: data))
          }
          self.tableView.reloadData()
        }
      }
    }
  }
  
  private func from(data: AnyObject) -> FoodCompany {
    let foodCompany: FoodCompany = FoodCompany()
    foodCompany.id = data["id"] as? Int
    foodCompany.name = data["name"] as? String
    foodCompany.description = data["description"] as? String
    foodCompany.logoUrl = data["logoUrl"] as? String
    foodCompany.header = data["header"] as? String
    foodCompany.averageRating = data["averageRating"] as? Int
    foodCompany.averageCheck = data["averageCheck"] as? Int
    return foodCompany
  }
}

extension FoodCompanyTableViewController {
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let stroryboard = UIStoryboard(name: "Main", bundle: nil)
    let dvc = stroryboard.instantiateViewController(withIdentifier: "foodID") as! DetailViewController
    
    let foodCompany = foodCompanyList[indexPath.row]
    
    dvc.id = foodCompany.id
    dvc.navTitle = foodCompany.name
    
    self.navigationController?.pushViewController(dvc, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foodCompanyList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodCustomCell
    
    let foodCompany = foodCompanyList[indexPath.row]
    
    cell.foodNameLabel.text = foodCompany.name
    cell.foodDescribeLabel.text = foodCompany.description
    
    if let imageUrl = foodCompany.logoUrl {
      cell.foodImageView?.load(fromUrl: imageUrl, complation: nil)
    }
    
    return cell
  }
}
