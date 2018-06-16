import 'package:scoped_model/scoped_model.dart';

class RaffleModel extends Model {
  List<Raffle> raffles = [Raffle(name: 'June'), Raffle(name: 'July'), Raffle(name: 'September')];

  void addRaffle(String name) {
    raffles.add(Raffle(name: name));
    notifyListeners();
  }

  void addUser(Raffle raffle, String name) {
    raffles[raffles.indexOf(raffle)].users.add(name);
    notifyListeners();
  }

  void drawWinner(Raffle raffle) {
    Raffle curRaffle = raffles[raffles.indexOf(raffle)];
    if(!curRaffle.winnerSelected) {
      curRaffle.users.shuffle();
      curRaffle.winnerSelected = true;
      notifyListeners();
    }
  }
}

class Raffle {
  Raffle({this.name});

  String name;
  List<String> users = ['John', 'Turk', 'Carla', 'Elliot'];
  bool winnerSelected = false;
}