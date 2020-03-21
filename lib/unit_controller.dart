import 'units.dart';

class UnitController {
  Units currentUnit;

  UnitController({this.currentUnit = Units.metric});

  UnitConversion get currentUnitConversion {
    return UnitController.unitsConversions[currentUnit];
  }

  static const unitsConversions = {
    Units.metric: const UnitConversion(),
    Units.imperial: UnitConversion(
      height: 2.52,
      weight: 0.453,
    )
  };
}

class UnitConversion {
  final double height;
  final double weight;

  const UnitConversion({
    this.height = 1,
    this.weight = 1,
  });
}
