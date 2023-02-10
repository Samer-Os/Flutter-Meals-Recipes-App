import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.ingredients,
    required this.steps,
  });

  String chooseComplexity() {
    switch (complexity) {
      case Complexity.challenging:
        return 'challenging';
      case Complexity.hard:
        return 'hard';
      case Complexity.simple:
        return 'simple';
    }
  }

  String chooseAffordability() {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';
      case Affordability.luxurious:
        return 'luxurious';
      case Affordability.pricey:
        return 'pricey';
    }
  }

  void mealDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetails.routeName,
      arguments: {
        'id': id,
        'title': title,
        'image': imageUrl,
        'ingredients': ingredients,
        'steps': steps,
      },
    ).then((mealId) {
      if (mealId != null){
        // removeItem(mealId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => mealDetails(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  padding: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.0001),
                        Colors.black.withOpacity(0.8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(chooseComplexity()),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(chooseAffordability()),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        elevation: 4,
      ),
    );
  }
}
