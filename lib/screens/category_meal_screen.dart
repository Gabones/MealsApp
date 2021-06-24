import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // final Color color;
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle, this.color);
  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['categoryId'];
    final categoryMeals = DUMMY_MEALS.where((receita) => receita.categories.contains(categoryId)).toList();
    //final color = routeArgs['color'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              url: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability
          );
        }, itemCount: categoryMeals.length,),
      ),
    );
  }
}
