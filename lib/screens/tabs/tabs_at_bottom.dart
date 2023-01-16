import 'package:flutter/material.dart';
import './../categories/categories.dart';
import './../categories/favorites.dart';
import './../../widgets/main_drawer.dart';
import './../../models/meal.dart';

class TabsAtBottom extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsAtBottom(this.favoriteMeals, {super.key});

  @override
  State<TabsAtBottom> createState() => _TabsAtBottomState();
}

// widget. is available only in initState() and build()
// chap 182. ( time at 5.15 min)
class _TabsAtBottomState extends State<TabsAtBottom> {
  late List<Map<String, dynamic>> _pages; 
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {
      'page': Categories(),
      'title': 'Categories',
    },
    {
      'page': Favorites(widget.favoriteMeals),
      'title': 'Your Favorite',
    },
  ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          // index will be passed to _selectPage automatically
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting, // default is fixed
          items: const [
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ]),
    );
  }
}
