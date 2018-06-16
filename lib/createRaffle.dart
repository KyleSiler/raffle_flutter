import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'raffle.dart';

class CreateRaffle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateRaffleState();
  }
}

class CreateRaffleState extends State<CreateRaffle> {
  String _raffleName;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<RaffleModel>(builder: (context, _, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('New Raffle'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                model.addRaffle(_raffleName);
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text('Raffle Name',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Container(
            width: 200.0,
            child: TextField(
              onChanged: (value) {
                _raffleName = value;
              },
            ),
          ),
        ]),
      );
    });
  }
}
