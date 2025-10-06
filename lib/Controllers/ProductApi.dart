import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getxproject/model/product';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var favoriteProduct = <bool>[].obs;

  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await dio.get("https://dummyjson.com/products");

      if (response.statusCode == 200) {
        var products = response.data['products'] as List;
        productList.value = products.map((e) => Product.fromJson(e)).toList();

        // Initialize favorite list with false values
        favoriteProduct.value = List.generate(
          productList.length,
          (index) => false,
        );
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }

  void selectProduct(int index) {
    // toggle favorite
    favoriteProduct[index] = !favoriteProduct[index];
    favoriteProduct.refresh();
  }
  void removeProduct(int index) {
  productList.removeAt(index);
  favoriteProduct.removeAt(index);
}


  // Get list of selected (favorite) products
  List<Product> get selectedFavorites {
    List<Product> selected = [];
    for (int i = 0; i < productList.length; i++) {
      if (favoriteProduct[i]) {
        selected.add(productList[i]);
      }
    }
    return selected;
  }
}
