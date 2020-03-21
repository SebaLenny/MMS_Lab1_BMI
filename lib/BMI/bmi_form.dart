import 'package:bmi_app/Unit/units.dart';
import 'package:bmi_app/Utility/strings.dart';
import 'package:flutter/material.dart';

import 'bmi_record.dart';
import 'bmi_text_form_field.dart';

class BMIForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final BMIRecord bmiRecord;
  final Function calculateBMI;
  final Units units;

  BMIForm({
    @required this.bmiRecord,
    @required this.calculateBMI,
    @required this.units,
  });

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
              units: Strings.unitsMap[units].height,
              initValue: bmiRecord.height,
            ),
            BMITextFormField(
              bmiRecord: bmiRecord,
              formKey: _formKey,
              strings: Strings.weightFieldStrings,
              updateField: (double val) {
                bmiRecord.weight = val;
              },
              units: Strings.unitsMap[units].weight,
              initValue: bmiRecord.weight,
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
                child: Text(Strings.calculate),
              ),
            )
          ],
        ),
      ),
    );
  }
}
