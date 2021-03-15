class Contacto{
  String name;
  String phone;

  Contacto({this.name,this.phone});

  Map<String, dynamic> toMap() {
    return {'name':name , 'phone':phone};
  }

  Contacto.map(dynamic obj){
    this.name = obj["name"];
    this.phone = obj["phone"];
  }

}