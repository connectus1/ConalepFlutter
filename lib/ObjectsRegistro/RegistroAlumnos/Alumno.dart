class Alumno{
  //---------------------
  //Atributos
  //---------------------
  String nombre;
  String correo;
  String contra;
  String plantel;
  String matricula;

  //--------------------
  //Constructor
  //----------------------
  Alumno({this.nombre, this.correo, this.contra, this.plantel, this.matricula});


  //--------------------
  //Metodos getter
  //----------------------
  String _getPlantel() => this.plantel;
  String _getCorreo() => this.correo;
  String _getContra() => this.contra;
  String _getMatricula() => this.matricula;
  String _getNombre() => this.nombre;



}