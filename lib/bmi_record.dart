import 'package:bmi_app/helpers.dart';

class BMIRecord {
  double weight;
  double height;

  int get bmi {
    if (height != null && weight != null) {
      var meterHeight = Helpers.toMeter(height);
      return (weight / (meterHeight * meterHeight)).floor();
    } else {
      return null;
    }
  }
}
