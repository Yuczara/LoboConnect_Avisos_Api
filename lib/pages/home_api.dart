/*import 'dart:async';
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
            //SizedBox(height:14.0),
            Tarjetas(),            
          ],
        ),
      ),
      ),
    );
  }
  

  Widget Tarjetas() {    
    final _screenSize = MediaQuery.of(context).size;

    avisosProvider.procesarRespuesta();
    return RefreshIndicator(
      onRefresh: _pullRefresh,
    child: FutureBuilder(
      future: avisosProvider.procesarRespuesta(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {   
        if(snapshot.hasData){
          return ShowAvisos(avisosList: snapshot.data);
        }else{
          return SizedBox(  
            height: _screenSize.height*0.90,
            child:  Column(  
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child:  CircularProgressIndicator(
                    backgroundColor: Colors.green,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo[900]),
                  ),
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
      Tarjetas();
    });
  }

 }


*/