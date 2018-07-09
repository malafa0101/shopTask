//
//  basket.swift
//  IncubatorUIShopTask
//
//  Created by Жанибек on 08.07.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import Foundation
class Basket{
  var count:Int?
  var name:String?
  var price:Int?
  func eldor4mo(){
//    BasketSingleton.basket.basket.append(contentsOf: )
  }
}


class BasketSingleton {
  var basket: [Cloth]
  private init(basket: [Cloth]) {
    self.basket = basket
  }
  
  public static let basket = BasketSingleton.init(basket: [Cloth]())
  
  
  
}
