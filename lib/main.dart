import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
// import './screens/tabs/tabs.dart';
import './screens/tabs/tabs_at_bottom.dart';
import './screens/categories/categories.dart';
import './screens/category_meals/category_meals.dart';
import './screens/category_meals/meal_detail.dart';
import './screens/filters/filters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  // favorites screen is not part of route registration, but part of Tabs Screen, so pass 
  // _faviorateMeals to Tabs Screen
  List<Meal> _faviorateMeals = []; 

  // This method gets called from inside Filters.dart screen
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        } else if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        } else if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        } else if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {

  }
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme:
            // ThemeData.light().textTheme.copyWith(
            //               bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            //   bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            //   headline6: const TextStyle(
            //     fontFamily: 'RobotoCondensed',
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const TextTheme(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: const Categories(),
      // routes: {
      //   '/': (context) => const Categories(),
      //   '/categories-meals': (context) => CategoryMeals()
      // },
      initialRoute: '/', // default is '/'
      routes: {
        '/': (context) => TabsAtBottom(_faviorateMeals), //const Tabs(),
        CategoryMeals.routeName: (context) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (context) => MealDetail(),
        Filters.routeName: (context) => Filters(_filters, _setFilters)
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => Categories(),);
      // },
      // similar to 404 page
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) => Categories(),
      //   );
      // },
    );
  }
}
