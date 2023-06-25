import 'package:flutter/material.dart';
import 'package:new_app37/login.dart';

import 'API.dart';
import 'home.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => login());
      case "/home":
        return MaterialPageRoute(builder: (_) => home());
      case "/API":
        return MaterialPageRoute(builder: (_) => API());
      default:
        return Error();
    }
  }
}

Route<dynamic> Error() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text("Error!"),
            ),
          ));
}//hello

