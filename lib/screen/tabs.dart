import 'package:flutter/material.dart';
import 'package:todak_app_task/screen/carts.dart';
import 'package:todak_app_task/screen/home.dart';
import 'package:todak_app_task/screen/orders.dart';
import 'package:todak_app_task/screen/profiles.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
  

    Widget activePage = Home();
    var activePageTitle = 'TDK eShop';

    if (_selectedPageIndex == 1) {
      activePage = OrdersScreen();
      activePageTitle = 'Orders';
    }
    if (_selectedPageIndex == 2) {
      activePage = ProfilesScreen();
      activePageTitle = 'Profile';
    }
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(activePageTitle),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => CartsScreen()));
              },
              icon: Icon(Icons.trolley))
        ],
      ),
      
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Orders'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
