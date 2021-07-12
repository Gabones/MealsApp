import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitch(String title, String subtitle,bool value, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meals preferences',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitch('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newValue) => setState(() => _glutenFree = newValue)),
                  _buildSwitch('Vegetarian', 'Only include vegetarian meals', _vegetarian, (newValue) => setState(() => _vegetarian = newValue)),
                  _buildSwitch('Vegan', 'Only include vegan meals', _vegan, (newValue) => setState(() => _vegan = newValue)),
                  _buildSwitch('Lactose-free', 'Only include lactose-free meals', _lactoseFree, (newValue) => setState(() => _lactoseFree = newValue)),
                ],
              ),
            )
          ],
        ));
  }
}
