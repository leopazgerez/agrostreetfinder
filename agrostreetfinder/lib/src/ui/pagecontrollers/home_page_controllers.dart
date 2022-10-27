import 'package:agrostreetfinder/src/datamanager/dataManager.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/field_model.dart';
import '../pages/load_field_page.dart';
import '../pages/load_track_page.dart';

class HomePageController extends ControllerMVC {
  DataManager dataManager;
  HomePageController._(this.dataManager);

  static HomePageController _this = HomePageController._(DataManager());
  static HomePageController get con => _this;
  factory HomePageController() {
    if (_this == null) _this = HomePageController._(DataManager());
    return _this;
  }

   void goToLoadFieldPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const LoadFieldPage(),
    )
    );
  }
   void goToLoadPointPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoadTrackPage(),
        )
    );
  }
  List<FieldModel> fields = [];

  void initPage(){
    fields = dataManager.getFieldModel();
  }
}



  // int get counter => Model.counter;
  // void incrementCounter() => Model.incrementCounter();
  // void decrementCounter() => Model.decrementCounter();
// }