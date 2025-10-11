import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getxproject/view_model/Profile/ProfilePage.dart';
import 'package:getxproject/view_model/Home_Page.dart';
import 'package:getxproject/view_model/products/ProductView.dart';

class PageRautes extends StatelessWidget {
  const PageRautes({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => HomePage());
          case '/shop':
            return MaterialPageRoute(builder: (_) => ProductView());
          case '/profile':
            return MaterialPageRoute(builder: (_) => ProfilePage());
          default:
            return MaterialPageRoute(builder: (_) => HomePage());
        }
      },
    );
  }
}
