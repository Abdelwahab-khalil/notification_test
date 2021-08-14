import 'package:flutter/foundation.dart';
import 'package:notification/services/notification_service.dart';

class MayKnowProvider with ChangeNotifier {
  var mayKnow = [
    {
      'name': 'Brooklyn Simmons',
      'image': 'assets/pic10.png',
      'address': '@alexandreestolano'
    },
    {
      'name': 'Devon Lane',
      'image': 'assets/pic11.png',
      'address': '@brunopadilha'
    },
    {
      'name': 'Ronald Richards',
      'image': 'assets/pic12.png',
      'address': '@izabellarodrigues'
    },
  ];

  var follows = [];

  Future<void> follow(String address) async {
    for (int i = 0; i < mayKnow.length; i++) {
      if (mayKnow[i]['address'] == address) {
        follows.add(mayKnow[i]);
        await initialNotification();
        await showNotification(
            mayKnow[i]['name'], mayKnow[i]['name'], mayKnow[i]['address']);
        mayKnow.remove(mayKnow[i]);
        notifyListeners();
      }
    }
  }

  Future<void> delete(String address) async {
    for (int i = 0; i < follows.length; i++) {
      if (follows[i]['address'] == address) {
        follows.remove(follows[i]);
        notifyListeners();
      }
    }
  }
}
