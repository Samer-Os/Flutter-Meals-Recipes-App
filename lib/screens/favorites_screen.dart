import 'package:flutter/material.dart';
import '../providers/meals.dart';
import 'package:provider/provider.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context);
    if (mealsData.favoriteMeals.isEmpty) {
      return const Center(
        child: Text('No favorites added yet'),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
            children: mealsData.favoriteMeals
                .map(
                  (meal) => MealItem(
                    id: meal.id,
                    title: meal.title,
                    imageUrl: meal.imageUrl,
                    duration: meal.duration,
                    complexity: meal.complexity,
                    affordability: meal.affordability,
                    ingredients: meal.ingredients,
                    steps: meal.steps,
                  ),
                )
                .toList()),
      );
    }
  }
}
