
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../pages/home_page.dart';

class LoadFieldPageController extends ControllerMVC {
  LoadFieldPageController._();

  static LoadFieldPageController _this = LoadFieldPageController._();

  static LoadFieldPageController get con => _this;
  final nameController = TextEditingController();
  final corpController = TextEditingController();
  final areaController = TextEditingController();
  factory LoadFieldPageController() {
    if (_this == null) _this = LoadFieldPageController._();
    return _this;
  }
  void saveField(){}
  void onPressedCancel(){}
  void backToHomePage(context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}