class ObjectVisita{
  //**************************
  //Atributos de la clase
  //*****************************
  String correo;
  String contra;
  String nombre;
  String plantel;

  //**************************
  //Constructor de la clase
  //*****************************
  ObjectVisita(){}

  //**************************
  //Metodos Getter
  //*****************************
  getCorreo(){
    return correo;
  }
  getContra(){
    return contra;
  }
  getNombre(){
    return nombre;
  }
  getPlantel(){
    return plantel;
  }

  //**************************
  //Metodos Setter
  //*****************************
  setCorreo(String correo){
    this.correo = correo;
  }
  setContra(String contra){
    this.contra = contra;
  }
  setNombre(String nombre){
    this.nombre = nombre;
  }
  setPlantel(String plantel){
    this.plantel = plantel;
  }


}