import 'package:flutter/material.dart';
import 'drawing.dart';
import 'package:scoped_model/scoped_model.dart';
import 'raffle.dart';
import 'createRaffle.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<RaffleModel>(builder: (context, _, model) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRaffle()));
            },
          ),
          appBar: AppBar(
            title: Text('Raffles'),
          ),
          body: ListView(
            children: model.raffles.reversed
                .map((raffle) => createListItem(raffle, context))
                .toList(),
          ));
    });
  }
}

Widget createListItem(Raffle raffle, BuildContext context) {
  return ListTile(
    onTap: () {
     Navigator.push(context, MaterialPageRoute(builder: (context) => Drawing(raffle: raffle))); 
    },
    title: Text(
      raffle.name,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    trailing:
        Text(raffle.users.length.toString(), style: TextStyle(fontSize: 18.0)),
  );
}
