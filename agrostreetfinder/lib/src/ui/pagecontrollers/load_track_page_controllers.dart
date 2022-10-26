import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';
class LoadTrackPageController extends ControllerMVC {
  LoadTrackPageController._();

  static LoadTrackPageController _this = LoadTrackPageController._();

  static LoadTrackPageController get con => _this;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  factory LoadTrackPageController() {
    if (_this == null) _this = LoadTrackPageController._();
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