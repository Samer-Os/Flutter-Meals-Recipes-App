import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = 'filters_screen';

  final Function applyFiltring;
  final Map<String, bool> filters;
  const Filters(this.applyFiltring, this.filters);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var glutenFree = false;
  var lactoseFree = false;
  var vegetarian = false;
  var vegan = false;



  Map<String, bool> filtersData = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false,
  };

  Widget buildSwitchListTile(
      String title, String description, bool value, Function updateSwitch) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: (_) => updateSwitch(_),
    );
  }
  @override
  void initState() {
    glutenFree = widget.filters['glutenFree'] as bool;
    lactoseFree = widget.filters['lactoseFree'] as bool;
    vegetarian = widget.filters['vegetarian'] as bool;
    vegan = widget.filters['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              filtersData['glutenFree'] = glutenFree;
              filtersData['lactoseFree'] = lactoseFree;
              filtersData['vegetarian'] = vegetarian;
              filtersData['vegan'] = vegan;
              widget.applyFiltring(filtersData);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'vegetarian',
                  'Only include vegetarian meals',
                  vegetarian,
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'vegan',
                  'Only include vegan meals',
                  vegan,
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
