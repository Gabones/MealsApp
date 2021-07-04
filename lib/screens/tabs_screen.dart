import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {'title': 'Receitas da Tia Nega', 'widget': CategoriesScreen()},
    {'title': 'Suas receitas Favoritas', 'widget': FavoritesScreen()}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
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

// return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('Receitas da Tia Nega'),
//         bottom: TabBar(
//           tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: 'Favorites',
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         children: [
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ],
//       ),
//     ),
// );
