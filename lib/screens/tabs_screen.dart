import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages = [];
  int selectedIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedIndex]['title'] as String),
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: pages[selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
