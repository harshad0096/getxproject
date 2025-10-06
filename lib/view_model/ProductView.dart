import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Controllers/ProductApi.dart';
import 'package:getxproject/view_model/ProductInfo.dart';
import 'package:getxproject/view_model/selectedProduct.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.blueAccent,
        actions: [
          Column(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 208, 55, 58),
                ),

                onPressed: () {
                  Get.to(() => FavoriteProductsPage());
                },
              ),
              Flexible(child: Text("Like")),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            final product = controller.productList[index];

            return Obx(() {
              final isFav = controller.favoriteProduct[index];
              return InkWell(
                onTap: () => Get.to(() => Productinfo(product: product)),
                child: Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.thumbnail,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      product.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFav ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () {
                                      controller.selectProduct(index);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 7, 5, 5),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "₹${product.price}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Add to Cart"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }
}
