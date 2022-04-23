

import '../product/base_product.dart';

class BaseCartItem {
  late BaseProduct product;
  late double quantity ;

  BaseCartItem(this.product, this.quantity);


  BaseCartItem.fromJson(Map<String , dynamic> jsonObject){
    this.product = BaseProduct.fromJson(jsonObject['product']);
    this.quantity = jsonObject ['quantity'] ;
  }

  double discount(){
    throw '';
  }

}