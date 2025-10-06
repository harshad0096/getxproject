import 'package:get/get.dart';
import 'package:getxproject/model/product';


class CartController extends GetxController {
  var cartProducts = <Product>[].obs;

  
  void addToCart(Product product) {
    
    if (!cartProducts.contains(product)) {
      cartProducts.add(product);
    }
  }
  void removeFromCart(Product product) {
    cartProducts.remove(product);
  }
// total of product
  double get totalPrice =>
      cartProducts.fold(0, (sum, product) => sum + (product.price ?? 0));
}
