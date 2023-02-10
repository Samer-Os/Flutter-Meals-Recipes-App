import 'package:flutter/material.dart';
import '../providers/meals.dart';
import 'package:provider/provider.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/mealDetails';


  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final imageUrl = routeArgs['image'];
    final ingredients = routeArgs['ingredients'];
    final steps = routeArgs['steps'];
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final mealsData = Provider.of<Meals>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title as String),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl.toString()),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'ingredients',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              width: 300,
              height: 200,
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: (ingredients as List<String>)
                    .map(
                      (ingredient) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ingredient,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              width: 300,
              height: 200,
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text((steps as List<String>)[index]),
                      ),
                      if ((steps).length - 1 != index) const Divider(),
                    ],
                  );
                },
                itemCount: (steps as List<String>).length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => mealsData.toggleFavorite(id as String),
        child: Icon(mealsData.checkFavorite(id as String) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
