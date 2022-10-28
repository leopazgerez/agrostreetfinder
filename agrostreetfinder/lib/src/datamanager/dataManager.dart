import 'package:agrostreetfinder/src/data_access/dummy.dart';
import '../interfaces/data_access.dart';
import '../models/field_model.dart';
import '../models/lot_model.dart';
import '../models/point_model.dart';

class DataManager {
  final IDataAccess dataAccess;
  DataManager._(this.dataAccess); //Constructor privado

  static final DataManager _instance = DataManager._(DummyData());

  static DataManager get instance => _instance;

  factory DataManager(){
    return _instance;
  }
  void loadField(FieldModel fieldModel){}
  void deleteField(FieldModel fieldModel){}
  void showField(FieldModel fieldModel){}
  void modifyField(FieldModel fieldModel){}
  void loadLot(LotModel lotModel){}
  void deleteLot(LotModel lotModel){}
  void showLot(LotModel lotModel){}
  void modifyLot(LotModel lotModel){}

  List<FieldModel> getFieldModel(){
    return dataAccess.getFieldModel();
  }

  List<LotModel> getLotModel(){
    return dataAccess.getLotModel();
  }

  List<PointModel> getPointModel(){
    return dataAccess.getPointModel();
  }
}

