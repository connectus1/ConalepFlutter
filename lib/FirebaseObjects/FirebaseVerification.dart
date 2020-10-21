
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verification{
  FirebaseDatabase fb;
  DatabaseReference reference;

  Verification(String url,String child){
    fb = FirebaseDatabase.instance;
    reference = fb.reference().child("Registro_Visitas");
  }

  Future<bool> getLogin() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String correo = _pref.getString("correo");

    Query q = reference.orderByChild("correo").equalTo(correo);
    q.onValue.isEmpty.then((flag) => (){
      return flag;
    });


  }

}
