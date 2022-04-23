
import '../order/base_order.dart';
import '../product/base_product.dart';
import 'customer.dart';

class CustomerController {
  Customer customer ;


 CustomerController(this.customer);

  void addToOrders(BaseOrder order){
    this.customer.orders.add(order);
  }
  void addToWatchList(BaseProduct product){
    this.customer.watchList.add(product);
  }
  bool OrderInOrders (BaseOrder order){
    return this.customer.orders.contains(order);
  }
  bool productInWatchList(BaseProduct product){
    return this.customer.watchList.contains(product);
  }
  bool removeProductFromWatchList (BaseProduct product){
    return this.customer.watchList.remove(product)  ;
  }

}






