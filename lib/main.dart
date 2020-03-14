import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _formKey = GlobalKey<FormState>();
  int bmi;
  double weight;
  double height;

  void _calculateBMI() {
    setState(() {
      bmi = (weight / (height * height)).floor();
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
          Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter your weight [kg]",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (String value) {
                      if(_formKey.currentState.validate())
                        weight = double.tryParse(value);
                    },
                    validator: (String value) {
                      double parsed = double.tryParse(value);
                      if (parsed == null) {
                        return 'Enter weight';
                      } else if (parsed <= 0 || parsed > 300) {
                        return 'Enter weight between 1 and 300';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter your height [cm]",
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    onSaved: (String value) {
                      if(_formKey.currentState.validate())
                        height = double.tryParse(value) * 0.01;
                    },
                    validator: (String value) {
                      double parsed = double.tryParse(value);
                      if (parsed == null) {
                        return 'Enter height';
                      } else if (parsed <= 0 || parsed > 300) {
                        return 'Enter height between 1 and 300';
                      }
                      return null;
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          _calculateBMI();
                        }
                      },
                      child: Text("Calculate"),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Text(bmi.toString()),
          ),
        ],
      ),
    );
  }
}
