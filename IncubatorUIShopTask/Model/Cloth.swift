struct Cloth {
  var name: String?
  var logoUrl: String?
  var price: Int?
  var type: ClothTypeEnum?
}

public enum ClothTypeEnum {
  case SHOES
  case GARMENT
}
