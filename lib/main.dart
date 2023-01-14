import 'package:flutter/material.dart';
// import './screens/tabs/tabs.dart';
import './screens/tabs/tabs_at_bottom.dart';
import './screens/categories/categories.dart';
import './screens/category_meals/category_meals.dart';
import './screens/category_meals/meal_detail.dart';
import './screens/filters/filters.dart';

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
        '/': (context) => const TabsAtBottom(), //const Tabs(),
        CategoryMeals.routeName: (context) => CategoryMeals(),
        MealDetail.routeName: (context) => MealDetail(),
        Filters.routeName:(context) => Filters( )
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
