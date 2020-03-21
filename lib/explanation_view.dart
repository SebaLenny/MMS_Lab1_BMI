import 'package:bmi_app/view_controller.dart';
import 'package:bmi_app/BMI/bmi_record.dart';
import 'package:flutter/material.dart';

import 'Utility/current_view.dart';
import 'Utility/strings.dart';

class ExplanationView extends StatelessWidget {
  final ViewController _viewController;
  final BMIRecord bmiRecord;

  ExplanationView(this._viewController, this.bmiRecord);

  String _getProperExplanation() {
    if (bmiRecord.bmi < 18.5) {
      return Strings.explanationUnderweight;
    } else if (bmiRecord.bmi < 25) {
      return Strings.explanationHealthy;
    } else if (bmiRecord.bmi < 30) {
      return Strings.explanationOverweight;
    } else {
      return Strings.explanationObese;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: Text(
              Strings.explanationTopline,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              bmiRecord.bmi.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            child: Text(
              Strings.explanationBottomline,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 15),
            alignment: Alignment.center,
            child: Text(
              _getProperExplanation(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          RaisedButton(
            onPressed: () {
              _viewController.goToView(CurrentView.form);
            },
            child: Text(Strings.back),
          )
        ],
      ),
    );
  }
}
