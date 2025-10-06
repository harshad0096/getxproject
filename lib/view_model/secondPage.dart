import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxproject/Controllers/Fistpagecontroller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final Fistpagecontroller fcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selected Likes")),
      body: Obx(() {
        var selected = fcontroller.selectLike;
        if (selected.isEmpty) {
          return Center(child: Text("No items selected"));
        }
        return ListView.builder(
          itemCount: selected.length,
          itemBuilder: (context, index) =>
              Card(child: ListTile(title: Text(selected[index]))),
        );
      }),
    );
  }
}
