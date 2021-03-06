import 'package:flutter/material.dart';
import 'package:flutter_authify_ui_app/constants.dart';
import 'package:flutter_authify_ui_app/pages/home_page.dart';
import 'package:flutter_authify_ui_app/utilities/animations/login_page_animation.dart';
import 'package:flutter_authify_ui_app/utilities/page_routes/fade_page_route.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  _AnimatedLoginPageState createState() => _AnimatedLoginPageState();
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
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
    return _LoginPage(_controller);
  }
}

class _LoginPage extends StatelessWidget {
  double _deviceHeight;
  double _deviceWidth;

  AnimationController _controller;
  EnterAnimation _animation;

  _LoginPage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimaryColor,
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
                height: _deviceHeight * 0.05,
              ),
              _emailTextField(),
              _passwordTextField(),
              SizedBox(
                height: _deviceHeight * 0.10,
              ),
              _loginButton(context),
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
              color: kSecondaryColor,
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

  Widget _emailTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'John.doe@gmail.com',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        obscureText: true,
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Colors.white),
      ),
      child: Text(
        'LOG IN',
        style: TextStyle(
          fontSize: 16,
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () async {
        await _controller.reverse();
        Navigator.pushReplacement(
          _context,
          FadePageRoute(AnimatedHomePage()),
        );
      },
    );
  }
}
