import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Controllers/Fistpagecontroller.dart';


import 'package:getxproject/view_model/ProductView.dart';

class Fistscreen extends StatelessWidget {
  Fistscreen({super.key});

  final Fistpagecontroller fcontroller = Get.put(Fistpagecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: fcontroller.like.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    fcontroller.toggleLike(index);
                  },
                  child: Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(fcontroller.like[index]),
                          Spacer(),
                          Obx(
                            () => Icon(
                              Icons.favorite,
                              color: fcontroller.likedItems[index]
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => ProductView());
            },
            child: Text("Go to Second Page"),
          ),
        ],
      ),
    );
  }
}
