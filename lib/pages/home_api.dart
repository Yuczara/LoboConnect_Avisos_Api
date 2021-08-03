import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loboc_avisos/Widgets/list_avisos.dart';
import 'package:loboc_avisos/pages/message_page.dart';
import 'package:loboc_avisos/services/Post_provider.dart';
import 'package:loboc_avisos/services/push_notification_service.dart';

class HomeApiPage extends StatefulWidget {
  @override
  _HomeApiPageState createState() => _HomeApiPageState();
}

class _HomeApiPageState extends State<HomeApiPage> {

  @override
  void initState() {
    super.initState();

    //FirebaseNotificationService
      PushNotificationService.messageStream.listen((message) { 
      print('******MyApp: $message');
        Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()),);
    });
  }

  final avisosProvider = new AvisosProvider();
  
  @override
  Widget build(BuildContext context) {

    avisosProvider.procesarRespuesta();
    return Scaffold(
      appBar: AppBar( 
        title: Text("Notificaciones",
        style: TextStyle(fontWeight: FontWeight.w100),
        ),
        backgroundColor: Colors.indigo.shade900,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(        
        color: Colors.teal.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height:14.0),
            _Tarjetas(),
            
          ],
        ),
      ),
      ),
    );
  }
  

  Widget _Tarjetas() {
    avisosProvider.procesarRespuesta();
    return RefreshIndicator(
      onRefresh: _pullRefresh,
    child: FutureBuilder(
      future: avisosProvider.procesarRespuesta(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {   
        if(snapshot.hasData){
          return ShowAvisos(avisosList: snapshot.data);
        }else{
          return Container(            
            child:  Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.signal_wifi_connected_no_internet_4_rounded,color: Colors.teal,size:80),
                ),
              Text(
               "Opps!! Ocurrió un error",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.grey,fontWeight: FontWeight.bold)
               ),
               
              ],
            ),           
          );
        }
      },
    )
    );
    
  }

    Future<void> _pullRefresh() async {
    setState(() {
      _Tarjetas();
    });
  }

 }


