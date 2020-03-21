import 'package:bmi_app/Unit/unit_controller.dart';
import 'package:bmi_app/Utility/helpers.dart';

class BMIRecord {
  double weight;
  double height;
  UnitController unitController;

  BMIRecord();

  BMIRecord.unit({this.unitController});

  int get bmi {
    if (height != null && weight != null) {
      final convertedHeight =
          Helpers.toMeter(height * unitController.currentUnitConversion.height);
      final convertedWeight =
          weight * unitController.currentUnitConversion.weight;
      return (convertedWeight / (convertedHeight * convertedHeight)).floor();
    } else {
      return null;
    }
  }
}
