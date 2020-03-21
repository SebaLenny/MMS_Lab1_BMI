import 'package:bmi_app/Utility/current_view.dart';
import 'package:bmi_app/Utility/dimens.dart';
import 'package:bmi_app/view_controller.dart';
import 'package:flutter/material.dart';

import 'Utility/helpers.dart';
import 'Utility/strings.dart';
import 'dart:math' as math;

class Result extends StatefulWidget {
  _ResultState _resultState;
  ViewController _viewController;

  Result(this._viewController);

  updateResult(int newResult) {
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
  Animation<double> numberAnimation;
  var _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    );

    _setupAnimation();
  }

  Color getProperColour() {
    var value = Helpers.map(numberAnimation.value, 18.5, 28, 150, 0).clamp(0, 360).toDouble();
    print(value);
    return HSVColor.fromAHSV(1, value, 1, 0.8).toColor();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return numberAnimation.value.floor() != 0
        ? GestureDetector(
            onTap: () {
              widget._viewController.goToView(CurrentView.explanation);
            },
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: Dimens.standardDistance),
                  child: Text(
                    Strings.bmiHeadline,
                    style: TextStyle(
                        fontSize: Dimens.fontHeader, color: Colors.blue),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimens.standardDistance),
                  decoration: BoxDecoration(
                    color: getProperColour(),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    numberAnimation.value.floor().toString(),
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: Dimens.fontHuge,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimens.standardDistance),
                  child: Text(
                    Strings.bmiBottomline,
                    style: TextStyle(
                        fontSize: Dimens.fontSecodnary, color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        : Container();
  }

  void _setupAnimation() {
    numberAnimation = Tween<double>(
      begin: 0,
      end: _resut.toDouble(),
    ).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  void updateResult(int value) {
    _resut = value.floor();
    _setupAnimation();

    _controller.reset();
    _controller.forward();
  }
}
