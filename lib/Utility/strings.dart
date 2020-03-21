import 'package:bmi_app/Unit/units.dart';

import 'text_field_strings.dart';
import 'units_strings.dart';

class Strings {
  static String get calculate => "Calculate";
  static String get units => "Units";
  static String get metric => "Metric";
  static String get imperial => "Imperial";
  static String get appAuthor => "App author";
  static String get bmiHeadline => "Your BMI is";
  static String get bmiBottomline => "Click it to find out what does it mean!";

  static TextFieldStrings get heightFieldStrings => TextFieldStrings(
        label: "Enter your height",
        emptyError: "Enter height",
        rangeError: "Enter height between 40 and 300",
      );
  static TextFieldStrings get weightFieldStrings => TextFieldStrings(
        label: "Enter your weight",
        emptyError: "Enter weight",
        rangeError: "Enter weight between 40 and 300",
      );

  static var unitsMap = {
    Units.metric: UnitsStrings(
      height: "cm",
      weight: "kg",
    ),
    Units.imperial: UnitsStrings(
      height: "in",
      weight: "lbs",
    )
  };
}
