import 'package:flutter/material.dart';
import './meal_item.dart';
import './../../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const String routeName = '/categories-meals';

  // Commented to use named routes and passing data instead of constructor

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMeals(this.categoryId, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];

    // filter category meals based on category id selected
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
