class Helpers {
  static double toMeter(double cm) {
    return cm * 0.01;
  }

  static double map(
      double x, double inMin, double inMax, double outMin, double outMax) {
    return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }
}
