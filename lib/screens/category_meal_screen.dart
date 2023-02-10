import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categoryMealScreen';

  final List<Meal> mealsAfterFiltring;
  const CategoryMealScreen(this.mealsAfterFiltring);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryName;
  late final List<Meal> availableMeals;
  var initData = false;

  @override
  void didChangeDependencies() {
    if (!initData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryName = routeArgs['title'];
      final categoryId = routeArgs['id'];
      availableMeals = widget.mealsAfterFiltring
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      initData = true;
    }
    super.didChangeDependencies();
  }

  // void removeItem(mealId){
  //   setState(() {
  //     availableMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName!),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: availableMeals
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
      ),
    );
  }
}
