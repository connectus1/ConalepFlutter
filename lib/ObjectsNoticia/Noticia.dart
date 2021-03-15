class Noticia{
  String noticia;
  String titulo;
  String fecha;
  String url;

  Noticia({this.noticia, this.titulo, this.fecha,this.url});

  Map<String, dynamic> toMap() {
    return {'fecha':fecha , 'titulo': titulo, 'noticia':noticia,'url':url};
  }

  Noticia.map(dynamic obj){
    this.fecha = obj["fecha"];
    this.titulo = obj["titulo"];
    this.noticia = obj["noticia"];
    this.url = obj["url"];
  }

}