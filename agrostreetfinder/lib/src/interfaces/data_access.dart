import '../models/field_model.dart';
import '../models/lot_model.dart';
import '../models/point_model.dart';

abstract class IDataAccess{

  List<FieldModel> getFieldModel();
  List<LotModel> getLotModel();
  List<PointModel> getPointModel();
  void loadField(FieldModel fieldModel){}
  void deleteField(FieldModel fieldModel){}
  void showField(FieldModel fieldModel){}
  void modifyField(FieldModel fieldModel){}
  void loadLot(LotModel lotModel){}
  void deleteLot(LotModel lotModel){}
  void showLot(LotModel lotModel){}
  void modifyLot(LotModel lotModel){}
}