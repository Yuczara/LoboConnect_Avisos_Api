/*import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loboc_avisos/models/post_model.dart';

class AvisosProvider {
  //metodo que procesa las peticiones http
  Future<List<Aviso>> procesarRespuesta() async{
  //metodo que procesa las peticiones http
    final resp = await http.get(Uri.parse('https://loboconnect.herokuapp.com/api/avisosPublicados'));

  //decodificamos la respuesta
    final decodedData = json.decode(resp.body);

   // print(decodedData['results']);
  final avisos = new Avisos.fromJsonList(decodedData);
  print(avisos.items);
    return avisos.items;
  }

}*/