
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'TypeUserScreen.dart';

class Preferences{

  final String _plantel = "plantel";
  final String _correo = "correo";
  final String _contra = "contra";
  final String _registro = "registro";

  final String _IdUser = "idUser";
  final String _nameUser = "nombre";

  final String _type = "type";

  //--------------------------------
  // Metodo que devuleve el indice seleccionado del plantel
  //-------------------------------------
  Future<int> indexPlantel() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getInt(_plantel) ?? 6;
  }

  //--------------------------------
  // Metodo que devuleve el correo del usuario
  //-------------------------------------
  Future<String> getCorreo() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getString(_correo) ?? "error";
  }

  //--------------------------------
  // Metodo que devuleve la contraseña del usuario
  //-------------------------------------
  Future<String> getContra() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getString(_contra) ?? "error";
  }

  //--------------------------------
  // Metodo que devuleve si el usuario ya esta registrado
  //-------------------------------------
  Future<bool> getReistro() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getBool(_registro) ?? false;
  }

  //--------------------------------
  // Metodo que devuleve la id del usuario en la base de datos
  //-------------------------------------
  Future<String> getIdUser() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getString(_IdUser);
  }

  //------------------------------
  //Metodo que devuelve el nombre del usuario
  //--------------------------------
  Future<String> getNombre() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getString(_nameUser);
  }

  Future<String> getType() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getString(_type);
  }

  Future<String> getPlantel() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return await _pref.getString(_plantel);
  }

  void deleteUser(BuildContext context) async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder:  (BuildContext context) => TypeUserScreen())
    );
  }


}