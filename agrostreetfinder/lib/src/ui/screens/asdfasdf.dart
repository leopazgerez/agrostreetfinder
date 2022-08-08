class Tester{
  var _addresses = <String, int>{};
  var _numEnt = <int>{};
  Tester(){}

      addNumEnt(int num){
    _numEnt.add(num);
    return _numEnt;
    }

    void getNumEnt(){
    print(_numEnt.length);
    }
}




