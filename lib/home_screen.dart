import 'package:flutter/material.dart';
import 'package:micro_ecommerce/screens/product_screen.dart';

import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeIndex = 0;

  List<String> titles = ['Home', 'Wishlist', 'Cart', 'Profile'];

  final List<Widget> body = const [
    ProductScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Text('Smart Shop'),
        // leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {
              print('Item added to cart!');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {
              print('Item added to cart!');
            },
            icon: Icon(Icons.person_2),
          ),
        ],
      ),
      body: body[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.white,
        currentIndex: _activeIndex,
        onTap: (index) {
          // حماصة العيل الرخم
          // setState
          print('GUBA :: current index $index');

          setState(() {
            _activeIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
