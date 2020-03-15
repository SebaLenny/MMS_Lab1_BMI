class BMIRecord {
  double weight;
  double height;

  int get bmi {
    if (height != null && weight != null) {
      return (weight / (height * height)).floor();
    } else {
      return null;
    }
  }
}
