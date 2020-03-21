import 'package:bmi_app/Unit/units.dart';

import 'text_field_strings.dart';
import 'units_strings.dart';

class Strings {
  static String get back => "Back";
  static String get units => "Units";
  static String get metric => "Metric";
  static String get imperial => "Imperial";
  static String get calculate => "Calculate";
  static String get appAuthor => "App author";
  static String get bmiHeadline => "Your BMI is";
  static String get bmiBottomline => "Click it to find out what does it mean!";
  static String get explanationTopline => "Your bmi";
  static String get explanationBottomline => "means that:";
  static String get explanationUnderweight =>
      "You are Underweight! Consider consulting it with your doctor!";
  static String get explanationHealthy =>
      "You are healthy weighted person! Keep it up!";
  static String get explanationOverweight =>
      "You are overweight! Consider consulting it with your doctor!";
  static String get explanationObese =>
      "You are obese! Consider consulting it with your doctor!";
  static String get authorAuthor => "Author";
  static String get authorName => "Sebastian Idziak";
  static String get authorStudentID => "228199";

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
