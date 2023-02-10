import 'package:flutter/material.dart';
import '../providers/meals.dart';
import 'package:provider/provider.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_details.dart';
import './screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> mealsAfterFiltring = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  Map<String, bool> filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false,
  };

  void applyFiltring(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      mealsAfterFiltring = DUMMY_MEALS.where((meal) {
        if ((filters['glutenFree'] as bool) && !meal.isGlutenFree) {
          return false;
        }
        if ((filters['lactoseFree'] as bool) && !meal.isLactoseFree) {
          return false;
        }
        if ((filters['vegetarian'] as bool) && !meal.isVegetarian) {
          return false;
        }
        if ((filters['vegan'] as bool) && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void manageFavoriteMeals(String mealID){
    final mealIndex = favoriteMeals.indexWhere((meal) => meal.id == mealID);
    setState(() {
      if (mealIndex >= 0){
        favoriteMeals.removeAt(mealIndex);
      } else {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      }
    });
  }

  bool manageFavoriteIcon(String mealID){
    return favoriteMeals.any((meal) => meal.id == mealID);
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Meals(),
      child: MaterialApp(
        title: 'meal app',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
        ),
        routes: {
          '/': (ctx) => TabsScreen(),
          CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(mealsAfterFiltring),
          MealDetails.routeName: (ctx) => MealDetails(),
          Filters.routeName: (ctx) => Filters(applyFiltring, filters),
        },
      ),
    );
  }
}
