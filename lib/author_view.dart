import 'package:bmi_app/Utility/current_view.dart';
import 'package:bmi_app/Utility/dimens.dart';
import 'package:bmi_app/view_controller.dart';
import 'package:flutter/material.dart';

import 'Utility/strings.dart';

class AuthorView extends StatelessWidget {
  ViewController _viewController;

  AuthorView(this._viewController);

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
              Strings.authorAuthor,
              style: TextStyle(fontSize: Dimens.fontSecodnary),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(Dimens.smallDistance),
            alignment: Alignment.center,
            child: Text(
              Strings.authorName,
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
              Strings.authorStudentID,
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
