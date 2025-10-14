import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/AppBar/appBar.dart';
import 'package:getxproject/Controllers/card_controller.dart';
import 'package:getxproject/model/product';

class Productinfo extends StatelessWidget {
  final Product product;

  Productinfo({super.key, required this.product});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.title,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.thumbnail,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Price: \$${product.price}",
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),

              const SizedBox(height: 10),

              const SizedBox(height: 20),

              Text(
                product.description,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          cartController.addToCart(product);
          Get.snackbar(
            "Added to Cart",
            "${product.title} has been added!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade100,
          );
        },
        child: const Text("Add to Cart"),
      ),
    );
  }
}
