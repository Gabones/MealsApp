import 'package:flutter/material.dart';

import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas da Tia Nega',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.w300,
          )
        )
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        //'/category_meals': (ctx) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onGenerateRoute: (settings) { //quanto eu tento um pushNamed para um route que não existe
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) { //erro 404 se não encontrou nada de porra nenhuma cai aqui
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}