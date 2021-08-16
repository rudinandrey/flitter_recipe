import 'package:flutter/material.dart';
import 'package:recipes/recipe_detail.dart';
import 'recipe.dart';

void main() => runApp(RecipeApp());

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Recipe Calculator",
      home: MyHomePage(title: 'Recipe Calculator'),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: buildRecipeCard(Recipe.samples[index]),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RecipeDetail(recipe: Recipe.samples[index]);
                }));
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image(
              image: AssetImage(recipe.imageUrl),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              recipe.label,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino'),
            )
          ],
        ),
      ),
    );
  }
}
