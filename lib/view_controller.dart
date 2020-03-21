import 'package:bmi_app/Utility/current_view.dart';

class ViewController {
  Function refresh;
  CurrentView _currentView;
  CurrentView get currentView => _currentView;

  ViewController(this.refresh, this._currentView);

  void goToView(CurrentView view) {
    _currentView = view;
    refresh();
  }
}
