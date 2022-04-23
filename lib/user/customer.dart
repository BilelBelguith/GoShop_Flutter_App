





import 'package:projectpfe/user/user.dart';

import '../order/base_order.dart';
import '../order/order_controller.dart';
import '../product/base_product.dart';
import '../product/product_controller.dart';
import 'address.dart';

class Customer extends User {
  late Address shippingAddress;
  late Address billingAddress;

  late List<BaseProduct> watchList;
  late List<BaseOrder> orders;

  Customer(String id, String firstName, String lastaName, String email, String phone, String gender,
      Address shippingAddress , Address billingAddress , List<BaseProduct> watchList ,List<BaseOrder> orders)
      : super(id, firstName, lastaName, email, phone, gender) {
    this.shippingAddress=shippingAddress;
    this.billingAddress=billingAddress;
    this.orders = orders;
    this.watchList = watchList;

  }



  Customer.fromJson (Map<String,dynamic> jsonObject)
      : super(
      jsonObject['id'],
      jsonObject['first_name'],
      jsonObject['last_name'],
      jsonObject['email'],
      jsonObject['phone'],
      jsonObject['gender']){
    this.billingAddress =Address.fromjson(jsonObject['billing_address']);
    this.shippingAddress =Address.fromjson(jsonObject['shipping_address']);
    this.watchList =ProductController.toProducts(jsonObject['watch_list']);
    this.orders = OrderController.toOrders(jsonObject['orders']);
  }

}