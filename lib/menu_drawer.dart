import 'package:bmi_app/Utility/current_view.dart';
import 'package:bmi_app/view_controller.dart';
import 'package:flutter/material.dart';

import 'Unit/unit_controller.dart';
import 'Unit/units.dart';
import 'Utility/strings.dart';

class MenuDrawer extends StatefulWidget {
  UnitController unitController;
  Function refresh;
  ViewController viewController;

  MenuDrawer(this.unitController, this.refresh, this.viewController);

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
          title: Text(Strings.units),
          trailing: Icon(Icons.expand_more),
          children: <Widget>[
            ListTile(
              title: Text(Strings.metric),
              trailing: widget.unitController.currentUnit == Units.metric
                  ? Icon(Icons.check)
                  : null,
              onTap: () {
                widget.unitController.currentUnit = Units.metric;
                refresh();
              },
            ),
            ListTile(
              title: Text(Strings.imperial),
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
          title: Text(Strings.appAuthor),
          trailing: Icon(Icons.person),
          onTap: () {
            widget.viewController.goToView(CurrentView.author);
            Navigator.of(context).pop();
          },
        ),
      ],
    ));
  }
}
