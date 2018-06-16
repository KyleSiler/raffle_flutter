import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'raffle.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<RaffleModel>(
      model: RaffleModel(),
      child: MaterialApp(
        title: 'Raffle App',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
