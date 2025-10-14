import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/view_model/LikesProduct/selectedProduct.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(221, 53, 50, 50),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite_border_sharp, color: Colors.white),
          onPressed: () {
            Get.to(() => FavoriteProductsPage());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
