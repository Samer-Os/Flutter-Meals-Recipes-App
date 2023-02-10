import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback selectedOne) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: selectedOne,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Cooking Up!',
            style: TextStyle(
              color: Colors.pink,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile(
          'Meals',
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        buildListTile(
          'Filters',
          Icons.settings,
          () {
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          },
        ),
      ],
    );
  }
}
