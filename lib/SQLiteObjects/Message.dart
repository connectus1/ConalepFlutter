class Message{
  String fecha;
  String mensaje;
  String nombre;
  Message({this.fecha, this.mensaje, this.nombre});

  Map<String, dynamic> toMap() {
    return {'fecha':fecha , 'mensaje': mensaje, 'nombre':nombre};
  }

  Message.map(dynamic obj){
    this.fecha = obj["fecha"];
    this.mensaje = obj["mensaje"];
    this.nombre = obj["nombre"];
  }

  // Map<String, dynamic> toMap() => {
  //   "fecha": fecha,
  //   "mensaje":mensaje,
  //   "nombre": nombre,
  // };

  String get _fecha => fecha;
  String get _mensaje => mensaje;
  String get _nombre => nombre;


}