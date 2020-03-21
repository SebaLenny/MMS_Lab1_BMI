import 'units.dart';

class Strings {
  static const String unit_cm = "cm";

  static TextFieldStrings get heightFieldStrings => TextFieldStrings(
        label: "Enter your height",
        emptyError: "Enter height",
        rangeError: "Enter height between 1 and 300",
      );
  static TextFieldStrings get weightFieldStrings => TextFieldStrings(
        label: "Enter your weight",
        emptyError: "Enter weight",
        rangeError: "Enter weight between 1 and 300",
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

class TextFieldStrings {
  final String label;
  final String emptyError;
  final String rangeError;

  TextFieldStrings({
    this.label,
    this.emptyError,
    this.rangeError,
  });
}

class UnitsStrings {
  final String height;
  final String weight;

  UnitsStrings({
    this.height,
    this.weight,
  });
}
