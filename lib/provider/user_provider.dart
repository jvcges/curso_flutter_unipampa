import 'dart:math';

import 'package:curso_flutter_unipampa/data/data_users.dart';
import 'package:curso_flutter_unipampa/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Map<String, User> _items = {...DATA_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user.id != null && _items.containsKey(user.id.toString())) {
      //altera
      _items.update(user.id.toString(), (_) => user);
    } else {
      //cadastra
      final id = Random().nextInt(99999);
      _items.putIfAbsent(
        id.toString(),
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(int userId) {
    _items.remove(userId.toString());
    notifyListeners();
  }
}
