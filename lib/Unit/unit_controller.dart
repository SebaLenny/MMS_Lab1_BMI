import 'unit_conversion.dart';
import 'units.dart';

class UnitController {
  Units currentUnit;

  UnitController({this.currentUnit = Units.metric});

  UnitConversion get currentUnitConversion {
    return UnitController.unitsConversions[currentUnit];
  }

  static const unitsConversions = {
    Units.metric: const UnitConversion(),
    Units.imperial: const UnitConversion(
      height: 2.52,
      weight: 0.453,
    )
  };
}
