import 'package:flutter/material.dart';
import './../categories/categories.dart';
import './../categories/favorites.dart';
import './../../models/meal.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const Tabs(this.favoriteMeals, {super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,  // default
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(
              tabs: [
                // text takes String not Widget
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Categories(),
            Favorites(),
          ]),
        ));
  }
}
