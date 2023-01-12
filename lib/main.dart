import 'package:flutter/material.dart';
import './screens/categories/categories.dart';
import './screens/category_meals/category_meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          '/': (context) => const Categories(),
          CategoryMeals.routeName: (context) => CategoryMeals() 
        },
        );
  }
}
