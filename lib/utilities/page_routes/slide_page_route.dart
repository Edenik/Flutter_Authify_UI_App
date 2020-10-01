import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget _child;
  SlidePageRoute(this._child)
      : super(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation, Widget child) {
            animation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                .animate(animation);
            return SlideTransition(child: child, position: animation);
          },
          pageBuilder: (BuildContext context, animation, secondaryAnimation) {
            return _child;
          },
        );
}
