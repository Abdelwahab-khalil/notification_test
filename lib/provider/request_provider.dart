import 'package:flutter/foundation.dart';

class RequestProvider with ChangeNotifier {
  var requests = [
    {
      'name': 'Jerome Bell',
      'image': 'assets/pic5.png',
      'address': '@amandadasilva'
    },
    {
      'name': 'Guy Hawkins',
      'image': 'assets/pic6.png',
      'address': '@carolfernandes'
    },
    {'name': 'Cody Fisher', 'image': 'assets/pic7.png', 'address': '@johndue'},
    {
      'name': 'Jane Cooper',
      'image': 'assets/pic8.png',
      'address': '@tadeubonini'
    },
    {
      'name': 'Theresa Webb',
      'image': 'assets/pic9.png',
      'address': '@marcelosalomao'
    },
  ];

  var confirms = [];

  Future<void> confirm(String address) async {
    for (int i = 0; i < requests.length; i++) {
      if (requests[i]['address'] == address) {
        confirms.add(requests[i]);
        requests.remove(requests[i]);
        notifyListeners();
      }
    }
  }

  Future<void> delete(String address) async {
    for (int i = 0; i < requests.length; i++) {
      if (requests[i]['address'] == address) {
        requests.remove(requests[i]);
        notifyListeners();
      }
    }
  }
  Future<void> deleteConfirm(String address) async {
    for (int i = 0; i < confirms.length; i++) {
      if (confirms[i]['address'] == address) {
        confirms.remove(confirms[i]);
        notifyListeners();
      }
    }
  }
}
