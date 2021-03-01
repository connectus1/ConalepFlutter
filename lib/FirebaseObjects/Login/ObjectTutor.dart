class ObjectTutor{
  //**************************
  //Atributos de la clase
  //*****************************
  String correo;
  String contra;
  String nombre;
  String plantel;

  List<String> matriculas;

  //**************************
  //Metodo Constructor
  //*****************************
  ObjectTutor(){}

  //**************************
  // Metodos Getter
  //*****************************
  String getCorreo(){
    return correo;
  }
  String getContra(){
    return contra;
  }
  String getNombre(){
    return nombre;
  }
  List<String> getMatriculas(){
    return matriculas;
  }

  //**************************
  // Metodos Setter
  //*****************************
  setCorreo(String correo) {
    this.correo = correo;
  }
  setContra (String contra){
    this.contra = contra;
  }
  setNombre(String nombre) {
    this.nombre = nombre;
  }
  setMatriculas(List<String> matriculas){
    this.matriculas = matriculas;
  }

}