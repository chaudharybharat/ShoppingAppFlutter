import 'package:flutter/material.dart';

class HomePageRoute extends PageRouteBuilder {
  var route;
  HomePageRoute({@required this.route})
      : super(
          maintainState: false,
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 200),
        );
}
