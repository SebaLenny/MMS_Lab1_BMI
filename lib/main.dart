import 'package:flutter/material.dart';

import 'BMI/bmi_form.dart';
import 'BMI/bmi_record.dart';
import 'Unit/unit_controller.dart';
import 'menu_drawer.dart';
import 'result.dart';

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
  Result result = Result();

  _MyHomePageState() {
    bmiRecord = BMIRecord.unit(unitController: unitController);
  }

  void _calculateBMI() {
    result.updateResult(bmiRecord.bmi);
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MenuDrawer(unitController, refresh),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BMIForm(
            bmiRecord: bmiRecord,
            calculateBMI: _calculateBMI,
            units: unitController.currentUnit,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: result,
          ),
        ],
      ),
    );
  }
}
