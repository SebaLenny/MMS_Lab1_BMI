import 'package:bmi_app/Utility/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bmi_record.dart';

class BMITextFormField extends StatelessWidget {
  final BMIRecord bmiRecord;
  final GlobalKey<FormState> formKey;
  final TextFieldStrings strings;
  final Function updateField;
  final String units;
  final double initValue;

  BMITextFormField({
    @required this.bmiRecord,
    @required this.formKey,
    @required this.strings,
    @required this.updateField,
    @required this.units,
    @required this.initValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "${strings.label} [$units]",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      onSaved: (String value) {
        if (formKey.currentState.validate())
          updateField(double.tryParse(value));
      },
      validator: (String value) {
        double parsed = double.tryParse(value);
        if (parsed == null) {
          return strings.emptyError;
        } else if (parsed <= 0 || parsed > 300) {
          return strings.rangeError;
        }
        return null;
      },
      initialValue: initValue != null ?  initValue.floor().toString() : '',
    );
  }
}
