import 'package:bmi_app/unit_controller.dart';
import 'package:flutter/material.dart';

import 'units.dart';

class MenuDrawer extends StatefulWidget {
  UnitController unitController;
  Function refresh;

  MenuDrawer(this.unitController, this.refresh);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  void refresh() {
    setState(() {});
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        ExpansionTile(
          title: Text("Units"),
          trailing: Icon(Icons.expand_more),
          children: <Widget>[
            ListTile(
              title: Text("Metric"),
              trailing: widget.unitController.currentUnit == Units.metric
                  ? Icon(Icons.check)
                  : null,
              onTap: () {
                widget.unitController.currentUnit = Units.metric;
                refresh();
              },
            ),
            ListTile(
              title: Text("Imperial"),
              trailing: widget.unitController.currentUnit == Units.imperial
                  ? Icon(Icons.check)
                  : null,
              onTap: () {
                widget.unitController.currentUnit = Units.imperial;
                refresh();
              },
            ),
          ],
        ),
        ListTile(
          title: Text("App author"),
          trailing: Icon(Icons.person),
        ),
      ],
    ));
  }
}
