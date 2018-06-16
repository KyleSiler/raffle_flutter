import 'package:scoped_model/scoped_model.dart';
import 'raffle.dart';
import 'package:flutter/material.dart';

class Drawing extends StatefulWidget {
  Drawing({this.raffle});

  final Raffle raffle;

  @override
  State<StatefulWidget> createState() {
    return DrawingState();
  }
}

class DrawingState extends State<Drawing> {
  String _newUser;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<RaffleModel>(builder: (context, _, model) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.raffle.name), actions: [
          IconButton(
            icon: Icon(Icons.local_activity, color: Colors.amber),
            onPressed: () {
              model.drawWinner(widget.raffle);
            },
          )
        ]),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.raffle.users.length,
                itemBuilder: (context, index) {
                  return createUserRow(widget.raffle, index);
                },
              ),
              flex: 5,
            ),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 200.0,
                        child: TextField(
                          controller: TextEditingController(text: _newUser),
                          onChanged: (value) {
                            _newUser = value;
                          },
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            model.addUser(widget.raffle, _newUser);
                            _newUser = "";
                          });
                        },
                        child: Text('Add'),
                      )
                    ]),
                flex: 1),
          ],
        ),
      );
    });
  }
}

Widget createUserRow(Raffle raffle, int index) {
  return ListTile(
      leading: raffle.winnerSelected && index == 0
          ? Icon(Icons.star, color: Colors.amber)
          : null,
      title: Text(
        raffle.users[index],
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      trailing: raffle.winnerSelected ? Text((index + 1).toString()) : null);
}
