import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getxproject/view_model/Home_Page.dart';
import 'package:getxproject/view_model/Profile/ProfilePage.dart';
import 'package:getxproject/view_model/cardproduct/cardpage.dart';
import 'package:getxproject/view_model/products/ProductView.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var _selectedIndex = 0;
  var pages = [HomePage(), ProductView(), CartPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.greenAccent,
        selectedItemColor: const Color.fromARGB(255, 163, 228, 89),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
