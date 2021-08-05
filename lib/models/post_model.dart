/*class Avisos {

  List<Aviso> items = new List();

  Avisos();

  Avisos.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final aviso = new Aviso.fromJsonMap(item);
      items.add( aviso );
      print(items);
    }

  }

}

class Aviso {
  String titulo;
  String descripcion;
  String fechaPublicacion;
  String fechaOrdenamiento;

  Aviso({
    this.titulo,
    this.descripcion,
    this.fechaPublicacion,
    this.fechaOrdenamiento,
  });

  Aviso.fromJsonMap( Map<String, dynamic> json ) {

    titulo            = json['titulo'];
    descripcion       = json['descripcion'];
    fechaPublicacion  = json['fechaPublicacion'];
    fechaOrdenamiento = json['fechaOrdenamiento'];
  }


}
*/