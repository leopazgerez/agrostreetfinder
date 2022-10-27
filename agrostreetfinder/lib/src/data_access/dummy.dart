import 'package:agrostreetfinder/src/models/field_model.dart';
import 'package:agrostreetfinder/src/models/lot_model.dart';

import '../interfaces/data_access.dart';
import '../models/point_model.dart';

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
  List<LotModel> getLotModel(){
    return [
      LotModel(id: 1, name: 'A1', crop: 'Maiz'),
      LotModel(id: 2, name: 'A2', crop: 'Maiz'),
      LotModel(id: 3, name: 'A3', crop: 'Maiz'),
      LotModel(id: 4, name: 'A4', crop: 'Maiz'),
      LotModel(id: 5, name: 'A5', crop: 'Maiz'),
      LotModel(id: 6, name: 'A6', crop: 'Maiz'),
      LotModel(id: 7, name: 'A7', crop: 'Maiz'),
      LotModel(id: 8, name: 'A8', crop: 'Maiz'),
      LotModel(id: 9, name: 'A9', crop: 'Maiz'),
      LotModel(id: 10, name: 'A10', crop: 'Maiz'),
      LotModel(id: 11, name: 'A11', crop: 'Maiz'),
      LotModel(id: 12, name: 'A12', crop: 'Maiz'),
    ];
  }

  @override
  List<PointModel> getPointModel(){
    return [
      PointModel(id: 1,latitude: -25.4232047, longitude: -63.8405361),
      PointModel(id: 2,latitude: -25.4238239, longitude: -63.8448129),
      PointModel(id: 3,latitude: -25.4207018, longitude: -63.8572013),
      PointModel(id: 4,latitude: -25.4155529, longitude: -63.855015),
      PointModel(id: 5,latitude: -25.4155528, longitude: -63.8512873),
      PointModel(id: 6,latitude: -25.4176122, longitude: -63.842231),
      PointModel(id: 7,latitude: -25.4183985, longitude: -63.8328069),
      PointModel(id: 8,latitude: -25.4251991, longitude: -63.8359817),
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
