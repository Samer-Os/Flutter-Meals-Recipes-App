import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void selectCategory(BuildContext context, String id, String title) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...DUMMY_CATEGORIES.map((category) {
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            splashColor: Theme.of(context).primaryColor,
            onTap: () => selectCategory(context, category.id, category.title),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    category.color.withOpacity(0.7),
                    category.color,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
