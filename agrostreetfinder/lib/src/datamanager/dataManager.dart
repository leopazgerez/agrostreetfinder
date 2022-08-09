
class DataManager {
  DataManager._(); //Constructor privado

  static final DataManager _instance = DataManager._();

  static DataManager get instance => _instance;

  factory DataManager(){
    return _instance;
  }
}