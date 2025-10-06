import 'package:get/get.dart';

class Fistpagecontroller extends GetxController {
  var like = ["Apple", "Banana", "Mango", "Orange"].obs;

  var likedItems = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();

    likedItems.assignAll(List.generate(like.length, (index) => false));
  }

  void toggleLike(int index) {
    likedItems[index] = !likedItems[index];
    likedItems.refresh(); // refresh the UI
  }

  List<String> get selectLike {
    List<String> selected = [];
    for (int i = 0; i < like.length; i++) {
      if (likedItems[i]) {
        selected.add(like[i]);
      }
    }
    return selected;
  }
}
