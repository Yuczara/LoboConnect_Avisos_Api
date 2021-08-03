import 'package:flutter/material.dart';
import 'package:loboc_avisos/models/post_model.dart';

class AvisoDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Aviso aviso = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(aviso.titulo),        
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
      ),
       body: Column(
          children: <Widget>[
            Container(
              color: Colors.teal.shade100,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        aviso.fechaPublicacion,
                        style: TextStyle(fontSize: 14.0, color: Colors.indigo[900]),
                        textAlign:TextAlign.right,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(padding:const EdgeInsets.all(10.0),
            child: Container(
                  child: Text(
                  aviso.titulo,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    letterSpacing :1.0,
                  ),
                  textAlign:TextAlign.justify,
                  ),
              ),      ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  child: Text(
                  aviso.descripcion,
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing :0.9,
                  ),
                  textAlign:TextAlign.justify,
                  ),
              ),              
            ),            
          ],
        ),
    );
  }
}
