import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/model/product';

class Productinfo extends StatelessWidget {
  final Product product;

  const Productinfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "Product Details"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.thumbnail ?? "",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                product.title ?? "",
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
                product.description ?? "No description available",
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text("Add to Card"),
      ),
    );
  }
}
