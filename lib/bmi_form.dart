import 'package:bmi_app/bmi_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMIForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final BMIRecord bmiRecord;
  final Function calculateBMI;

  BMIForm({this.bmiRecord, this.calculateBMI});

  double _toMeter(double cm){
    return cm * 0.01;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              onSaved: (String value) {
                if (_formKey.currentState.validate())
                  bmiRecord.weight = double.tryParse(value);
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
                if (_formKey.currentState.validate())
                  bmiRecord.height = _toMeter(double.tryParse(value));
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
                    calculateBMI();
                  }
                  FocusScope.of(context).unfocus();
                },
                child: Text("Calculate"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
