import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/AppBar/appBar.dart';
import 'package:getxproject/Controllers/card_controller.dart';
import 'package:getxproject/model/product';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Cart"),

      body: Obx(() {
        if (cart.cartProducts.isEmpty) {
          return const Center(
            child: Text(
              "Your cart is empty 🛒",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          itemCount: cart.cartProducts.length,
          itemBuilder: (context, index) {
            final Product product = cart.cartProducts[index];
            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Image.network(
                  product.thumbnail,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported),
                ),
                title: Text(product.title),
                subtitle: Text("₹${product.price}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => cart.removeFromCart(product),
                ),
              ),
            );
          },
        );
      }),

      bottomNavigationBar: Obx(
        () => Container(
          color: Colors.blueGrey.shade50,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹${cart.totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Checkout",
                    "Proceeding to payment...",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text("Checkout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
