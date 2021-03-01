class ObjectAlumno {

  //**************************
  //Atributos de la clase
  //*****************************
  String contra;
  String correo;
  String matricula;
  String nombre;
  String plantel;

  //**************************
  //Metodo constructor
  //*****************************
  ObjectAlumno(){}

  //**************************
  //Metodo para getters de los atributos
  //*****************************
  String getCorreo() {
    return correo;
  }
  String getContra() {
    return contra;
  }
  String getMatricula() {
    return matricula;
  }
  String getNombre(){
    return nombre;
  }
  String getPlantel(){
    return plantel;
  }

  //**************************
  // Metodos para Setter los atributos
  //*****************************
  setCorreo(String correo){
    this.correo = correo;
  }
  setContra(String contra){
    this.contra = contra;
  }
  setMatricula(String matricula){
    this.matricula = matricula;
  }
  setNombre(String nombre){
    this.nombre = nombre;
  }
  setPlantel(String plantel){
    this.plantel = plantel;
  }


}