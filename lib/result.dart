import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  _ResultState _resultState;

  updateResult(int newResult) {
    print("new result: $newResult");
    _resultState.updateResult(newResult);
  }

  @override
  _ResultState createState() {
    _resultState = _ResultState();
    return _resultState;
  }
}

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  int _resut = 0;
  AnimationController _controller;
  Animation<double> animation;
  var _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    );

    _setupAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      animation.value.floor().toString(),
      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 80),
    );
  }

  void _setupAnimation() {
    animation = Tween<double>(
      begin: 0,
      end: _resut.toDouble(),
    ).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });
  }

  void updateResult(int value) {
    _resut = value.floor();
    _setupAnimation();

    _controller.reset();
    _controller.forward();
  }
}
