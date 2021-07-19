import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // final Color color;
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle, this.color);
  static const routeName = '/category_meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['categoryId'];
    displayedMeals = widget.availableMeals.where((receita) => receita.categories.contains(categoryId)).toList();
    //final color = routeArgs['color'];
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              url: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability
          );
        }, itemCount: displayedMeals.length,),
      ),
    );
  }
}
