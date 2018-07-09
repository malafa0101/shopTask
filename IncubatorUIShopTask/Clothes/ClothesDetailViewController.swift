import UIKit
import AlamofireImage
import Alamofire

class ClothesDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
  
  @IBOutlet weak var collectionEmptyViewLabel: UICollectionView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var clothesDetailSegment: UISegmentedControl!

  var companyId:Int?
  
  
  private let URL_RESPONSE = "https://megaapi.herokuapp.com/api/cloth/id/"
  
  private var clothes = [Cloth]()
  private var clothesCompany = [ClothCompany]()
  private var currentClothType: ClothTypeEnum?
  var dubleClothCompany:ClothCompany?
//  var dataObject = [AnyObject]()
  var brandName:String?
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  public func set(title: String?) {
    self.navigationItem.title = title
  }
  
  
  

  
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   let destination = segue.destination as! SwipingControll
    destination.cloth = clothes[(collectionView.indexPathsForSelectedItems?.first?.row)!]
//    destination.nameBrandToppic.text = brandName
  }
  
  private func loadData() {
    Alamofire.request("\(URL_RESPONSE)\(companyId!)").responseJSON { res in
      if let dict = res.result.value as? Dictionary<String,AnyObject>{
        if let dataList = dict["data"] as? [AnyObject]{
          for data in dataList {
            self.clothes.append(self.from(data: data))
          }
          self.collectionView.reloadData()
        }
      }
    }
  }
  
  private func from(data: AnyObject) -> Cloth {
    var cloth = Cloth()
    cloth.name = data["name"] as? String
    cloth.logoUrl = data["logoUrl"] as? String
    cloth.price = data["price"] as? Int
    cloth.type = get(type: data["type"] as? String)
    return cloth
  }
  
  private func get(type: String?) -> ClothTypeEnum? {
    guard type != nil else { return nil }
    switch type! {
    case "garment": return .GARMENT
    case "shoes": return .SHOES
    default: return nil
    }
  }
  
  @IBAction func onChoseClothType(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 1:
      currentClothType = .GARMENT
      break
    case 2:
      currentClothType = .SHOES
      break
    default:
      currentClothType = nil
    }
    self.collectionView.reloadData()
  }
  
  private func getCurrentClothTypeEnum() -> [Cloth] {
    return clothes.filter({ (cloth) -> Bool in
      if let type = currentClothType  {
        return cloth.type == type
      }
      return true
    })
  }
}

extension ClothesDetailViewController {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return getCurrentClothTypeEnum().count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ClothesDetailCollectionViewCell
  
    let cloth = getCurrentClothTypeEnum()[indexPath.row]
    
    cell.clothesDetailNameLabel.text = cloth.name!
    cell.clothesDetailPriceLabel.text = "\(String(describing: cloth.price!)) тг"
    cell.clothesDetailImageView.load(fromUrl: cloth.logoUrl!, complation: nil)
    
    return cell
  }
}
