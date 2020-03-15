import 'package:bmi_app/bmi_form.dart';
import 'package:bmi_app/bmi_record.dart';
import 'package:flutter/material.dart';

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
  BMIRecord bmiRecord = BMIRecord();

  void _calculateBMI() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BMIForm(
            bmiRecord: bmiRecord,
            calculateBMI: _calculateBMI,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Text(bmiRecord.bmi.toString()),
          ),
        ],
      ),
    );
  }
}
