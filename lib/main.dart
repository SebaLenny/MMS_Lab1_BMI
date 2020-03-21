import 'package:bmi_app/Utility/dimens.dart';
import 'package:bmi_app/author_view.dart';
import 'package:bmi_app/explanation_view.dart';
import 'package:flutter/material.dart';

import 'BMI/bmi_form.dart';
import 'BMI/bmi_record.dart';
import 'Unit/unit_controller.dart';
import 'Utility/current_view.dart';
import 'menu_drawer.dart';
import 'result.dart';
import 'view_controller.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      theme: ThemeData(primarySwatch: Colors.blue, buttonColor: Colors.blue),
      home: MyHomePage(title: 'Calculate your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UnitController unitController = UnitController();
  BMIRecord bmiRecord;
  Result result;
  ViewController viewController;

  _MyHomePageState() {
    bmiRecord = BMIRecord.unit(unitController: unitController);
    viewController = ViewController(refresh, CurrentView.form);
    result = Result(viewController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MenuDrawer(unitController, refresh, viewController),
        body: _selectView());
  }

  void _calculateBMI() {
    result.updateResult(bmiRecord.bmi);
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  Widget _selectView() {
    if (viewController.currentView == CurrentView.form) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BMIForm(
            bmiRecord: bmiRecord,
            calculateBMI: _calculateBMI,
            units: unitController.currentUnit,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: Dimens.standardDistance),
            alignment: Alignment.center,
            child: result,
          ),
        ],
      );
    } else if (viewController.currentView == CurrentView.explanation) {
      return ExplanationView(viewController, bmiRecord);
    } else if (viewController.currentView == CurrentView.author) {
      return AuthorView(viewController);
    }
    return Container();
  }
}
