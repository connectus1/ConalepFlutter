class ItemUser{

  String nombre;
  String correo;
  String contra;
  String plantel;

  //---------------------------
  //Constructor del objeto
  //---------------------------
  ItemUser();

  //---------------------------
  //Estos metodos se encargan de hacer get en la informacion del objeto User
  //---------------------------
  String getCorreo(){
    return correo;
  }

  String getcontra(){
    return contra;
  }

  String getPlantel(){
    return plantel;
  }

  String getNombre(){
    return nombre;
  }

  //---------------------------
  //Estos metodos se encargan de settear la informacion del objeto User
  //---------------------------
  void setCorreo(String correo){
    this.correo = correo;
  }

  void setContra(String contra){
    this.contra = contra;
  }

  void setPlantel(String plantel){
    this.plantel = plantel;
  }

  void setNombre(String nombre){
    this.nombre = nombre;
  }


}