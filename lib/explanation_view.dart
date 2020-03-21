import 'package:bmi_app/Utility/dimens.dart';
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
      margin: EdgeInsets.all(Dimens.standardDistance),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: Dimens.standardDistance),
            alignment: Alignment.center,
            child: Text(
              Strings.explanationTopline,
              style: TextStyle(fontSize: Dimens.fontSecodnary),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(Dimens.smallDistance),
            alignment: Alignment.center,
            child: Text(
              bmiRecord.bmi.toString(),
              style: TextStyle(
                fontSize: Dimens.fontPrimary,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: Dimens.standardDistance),
            alignment: Alignment.center,
            child: Text(
              Strings.explanationBottomline,
              style: TextStyle(fontSize: Dimens.fontSecodnary),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: Dimens.standardDistance),
            alignment: Alignment.center,
            child: Text(
              _getProperExplanation(),
              style: TextStyle(fontSize: Dimens.fontSecodnary),
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
