import 'package:flutter/material.dart';
import './../../screens/category_meals/meal_item.dart';
import './../../models/meal.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const Favorites(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return const Center(
      child: Text('You have no favorites yet - start adding some!'),
    );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,              
            );
          },
          itemCount: favoriteMeals.length,
        );
    }

    return Center(
      child: Text('You have no favorites yet - start adding some!'),
    );
  }
}
