// Flutter imports:
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isDispose = false;
  // bool _loading = false;
  // bool get loading => _loading;
  // setLoading(bool loading) {
  //   _loading = loading;
  //   notifyListeners();
  // }

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }
}
