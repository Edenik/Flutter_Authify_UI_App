import 'package:flutter/material.dart';
import 'package:flutter_authify_ui_app/constants.dart';
import 'package:flutter_authify_ui_app/pages/login_page.dart';
import 'package:flutter_authify_ui_app/utilities/animations/login_page_animation.dart';
import 'package:flutter_authify_ui_app/utilities/page_routes/fade_page_route.dart';
import 'package:flutter_authify_ui_app/utilities/page_routes/slide_page_route.dart';

class AnimatedHomePage extends StatefulWidget {
  @override
  _AnimatedHomePageState createState() => _AnimatedHomePageState();
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HomePage(_controller);
  }
}

class _HomePage extends StatelessWidget {
  double _deviceHeight;
  double _deviceWidth;

  AnimationController _controller;
  EnterAnimation _animation;

  _HomePage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: _deviceWidth,
          height: _deviceHeight * 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _avatarWidget(),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _nameWidget(),
              SizedBox(
                height: _deviceHeight * 0.10,
              ),
              _logoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double _circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _animation.getController,
      builder: (BuildContext _context, Widget _widget) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(_animation.getCircleSize.value,
              _animation.getCircleSize.value, 1),
          child: Container(
            height: _circleD,
            width: _circleD,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(500),
              image: DecorationImage(
                image: AssetImage('assets/images/main_avatar.png'),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _nameWidget() {
    return Container(
      child: Text(
        'John Doe',
        style: TextStyle(
            color: kPrimaryColor, fontSize: 35, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _logoutButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: kPrimaryColor,
          width: 3,
        ),
      ),
      child: Text(
        'LOG OUT',
        style: TextStyle(
          fontSize: 16,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          _context,
          SlidePageRoute(AnimatedLoginPage()),
        );
      },
    );
  }
}
