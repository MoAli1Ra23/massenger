import 'package:flutter/foundation.dart';
 
class Man extends ChangeNotifier {
  int g = 0;

  inc() {
    g++;
    notifyListeners();
  }

  dec() {
    g--;
    notifyListeners();
  }
  Stream<int> ali(){
   
 return   Stream.periodic(const Duration(seconds: 1),(v)=>v++,);
     

  }
 }
