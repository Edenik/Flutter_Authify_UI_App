import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget _child;
  FadePageRoute(this._child)
      : super(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(child: child, opacity: animation);
          },
          pageBuilder: (BuildContext context, animation, secondaryAnimation) {
            return _child;
          },
        );
}
