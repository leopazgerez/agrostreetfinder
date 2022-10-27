import 'package:agrostreetfinder/src/models/field_model.dart';
import 'package:agrostreetfinder/src/models/lot_model.dart';
import 'package:agrostreetfinder/src/models/type_production_agricola_model.dart';

import '../interfaces/data_access.dart';

class DummyData implements IDataAccess{
  DummyData();

  void addFieldModel(FieldModel fieldModel) {
  }

  @override
  List<FieldModel> getFieldModel() {
    return [
      FieldModel(1000,'Agricola', 'Soja', 1, ''),
      FieldModel(1000,'Agricola', 'Poroto', 2, ''),
      FieldModel(1000,'Agricola', 'Garbanzo', 3, ''),
      FieldModel(1000,'Agricola', 'Maiz', 4, ''),
      FieldModel(1000,'Agricola', 'Sorgo', 5, ''),
      FieldModel(1000,'Agricola', 'Alfalfa', 6, ''),
    ];
  }

  @override
  void deleteField(FieldModel fieldModel) {
  }

  @override
  void deleteLot(LotModel lotModel) {
  }

  @override
  void loadField(FieldModel fieldModel) {
  }

  @override
  void loadLot(LotModel lotModel) {
  }

  @override
  void modifyField(FieldModel fieldModel) {
  }

  @override
  void modifyLot(LotModel lotModel) {
  }

  @override
  void showField(FieldModel fieldModel) {
  }

  @override
  void showLot(LotModel lotModel) {
  }
}
