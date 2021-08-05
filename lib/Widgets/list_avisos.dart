/*import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loboc_avisos/models/post_model.dart';
import 'package:loboc_avisos/pages/home_api.dart';

class ShowAvisos extends StatelessWidget {
  final List<Aviso> avisosList;
  ShowAvisos({@required this.avisosList});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    if(avisosList.isNotEmpty){
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

    }else{
      return  SizedBox(  
            height: _screenSize.height*0.90,
            child:  Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.indigo[900],
                    radius: 60,
                    child: Icon(Icons.done_outline_rounded,size: 50,color: Colors.lightGreen,),
                 ),
                ),
                SizedBox(height: 20.0,),
               Text(
                    "No tienes avisos",
                    textAlign: TextAlign.center,
                     style: TextStyle(fontSize: 25.0, color: Colors.indigo[900],fontWeight: FontWeight.w300,)
                  ),
              ],
            ),           
          );
    }

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
  }*/