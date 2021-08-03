import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loboc_avisos/models/post_model.dart';
import 'package:loboc_avisos/pages/home_api.dart';

class ShowAvisos extends StatelessWidget {
  final List<Aviso> avisosList;
  ShowAvisos({@required this.avisosList});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Flexible(
    child: Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: _screenSize.height,
            child: new ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: avisosList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _tarjeta(context,avisosList[index]);
              },
            ),
          ),
        ),
      ],
    ),
   );
  }
}

Widget _tarjeta(BuildContext context,Aviso aviso){
      final tarjeta = Card(
        child: ListTile(
          leading: Icon(Icons.notifications_none_outlined,color: Colors.amber),
          title: Text(
            aviso.titulo,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87, 
              fontWeight: FontWeight.w400
            ),
          ),
          trailing: Text(
            aviso.fechaPublicacion,
            style: TextStyle(fontSize: 14.0, color: Colors.blueGrey),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Text(
              aviso.descripcion,
              style: TextStyle(fontSize: 16),
              ),
          ),
        ),
      );

      return GestureDetector(
        child: tarjeta,
        onTap: (){
          Navigator.pushNamed(context,'detalle',arguments: aviso);
        },
      );
  }