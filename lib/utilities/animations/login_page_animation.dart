import 'package:flutter/material.dart';

class EnterAnimation {
  EnterAnimation(this._controller) {
    _circleSize = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(curve: Curves.easeInOutBack, parent: _controller),
    );
  }

  AnimationController _controller;
  Animation<double> _circleSize;

  AnimationController get getController {
    return _controller;
  }

  Animation<double> get getCircleSize {
    return _circleSize;
  }
}
