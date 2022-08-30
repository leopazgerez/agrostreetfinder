//
// class DataManager {
//   DataManager._(); //Constructor privado
//
//   static final DataManager _instance = DataManager._();
//
//   static DataManager get instance => _instance;
//
//   factory DataManager(){
//     return _instance;
//   }
// }
class DataManager{
  static DataManager? _instance;

  DataManager(){}

  static DataManager? GetInstance(){
    if(_instance == null){
      _instance = new DataManager();
    }
    return _instance;
  }
}