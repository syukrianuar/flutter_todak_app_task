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

  //--> NO LONGER USE (NOW USING THE RIVERPOD STATE MANAGEMENT) <--
  // final List<Meal> favoriteMeals = [];
  // Map<Filter, bool> _selectedFilters = kInitialFilters;

  //--> NO LONGER USE (NOW USING THE RIVERPOD STATE MANAGEMENT) <--
  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = favoriteMeals.contains(meal);

  // void showSnackbarMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  //   if (isExisting) {
  //     setState(() {
  //       favoriteMeals.remove(meal);
  //     });
  //     showSnackbarMessage('Meal has been removed from favorites.');
  //   } else {
  //     setState(() {
  //       favoriteMeals.add(meal);
  //     });
  //     showSnackbarMessage('Meal is added to favorites!');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // void _setScreen(String identifier) async {
  //   Navigator.pop(context);
  //   if (identifier == 'filters') {
  //     // Due to Riverpod
  //     // final result =
  //     await Navigator.push<Map<Filter, bool>>(
  //         context,
  //         MaterialPageRoute(
  //             builder: (ctx) => FiltersScreen(
  //                 // currentFilters: _selectedFilters,
  //                 )));
  //     // Due to riverpod
  //     // setState(() {
  //     //   _selectedFilters = result ?? kInitialFilters;
  //     // });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final availableMeals = ref.watch(filteredMealsProvider);

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
      // drawer: MainDrawer(
      //   onSelectScreen: _setScreen,
      // ),
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
