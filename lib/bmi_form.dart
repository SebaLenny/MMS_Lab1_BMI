import 'package:bmi_app/bmi_record.dart';
import 'package:bmi_app/bmi_text_form_field.dart';
import 'package:flutter/material.dart';

import 'strings.dart';

class BMIForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final BMIRecord bmiRecord;
  final Function calculateBMI;

  BMIForm({this.bmiRecord, this.calculateBMI});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            BMITextFormField(
              bmiRecord: bmiRecord,
              formKey: _formKey,
              strings: Strings.heightFieldStrings,
              updateField: (double val) {
                bmiRecord.height = val;
              },
            ),
            BMITextFormField(
              bmiRecord: bmiRecord,
              formKey: _formKey,
              strings: Strings.weightFieldStrings,
              updateField: (double val) {
                bmiRecord.weight = val;
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
