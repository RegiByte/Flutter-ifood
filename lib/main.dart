import 'package:flutter/material.dart';
import 'package:ifoodclone/screens/list_restaurants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFood',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
      initialRoute: ListRestaurants.id,
      routes: {ListRestaurants.id: (context) => ListRestaurants()},
    );
  }
}
