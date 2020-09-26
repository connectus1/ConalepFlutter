import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((state){
        if(state){
          _navigationToHome();
        }else{

        }
    });

  }

  Future<bool> _mockCheckForSession() async{
      await Future.delayed(Duration(milliseconds: 5000), () {});

      return true;
  }

  void _navigationToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          child: Image.asset('assets/images/logo_app.png', width: 200,height: 200),
        ),
      ),

      //
    );
  }


}

