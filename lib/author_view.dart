import 'package:bmi_app/Utility/current_view.dart';
import 'package:bmi_app/view_controller.dart';
import 'package:flutter/material.dart';

class AuthorView extends StatelessWidget {
  ViewController _viewController;

  AuthorView(this._viewController);

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
              "Author",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              "Sebastian Idziak",
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
              "228199",
              style: TextStyle(fontSize: 20),
            ),
          ),
          RaisedButton(
            onPressed: () {
              _viewController.goToView(CurrentView.form);
            },
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}
