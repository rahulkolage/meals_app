import 'package:flutter/material.dart';
import './meal_item.dart';
// import './../../dummy_data.dart';
import './../../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const String routeName = '/categories-meals';

  final List<Meal> _availableMeals;

  const CategoryMeals(this._availableMeals, {super.key});

// Commented to use named routes and passing data instead of constructor

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMeals(this.categoryId, this.categoryTitle, {super.key});

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  // https://sarunw.com/posts/dart-initialize-variables-constructor-body/

  late String categoryTitle; // mutable property, not final
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // context is not available, therefore using didChangeDependencies
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];

      // we use widget._availableMeals, which comes from main.dart
      // instead DUMMY_MEALS directly
      // filter category meals based on category id selected
      // displayedMeals = DUMMY_MEALS.where(
      //   (meal) {
      //     return meal.categories.contains(categoryId);
      //   },
      // ).toList();

      displayedMeals = widget._availableMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();

      _loadedInitData = true;
    }

    //  <==============
    super.didChangeDependencies();
  }

  // replaced with favorite screen
  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // // moving this code to initState
    // final routeArgs =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title']!;
    // final categoryId = routeArgs['id'];

    // // filter category meals based on category id selected
    // final categoryMeals = DUMMY_MEALS.where(
    //   (meal) {
    //     return meal.categories.contains(categoryId);
    //   },
    // ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              // removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
