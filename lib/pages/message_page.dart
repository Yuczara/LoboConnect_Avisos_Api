import 'package:flutter/material.dart';
import 'package:loboc_avisos/services/push_notification_service.dart';
import 'home_api.dart';

 class MessagePage extends StatefulWidget {
 
  @override
  _MessagePageState createState() => _MessagePageState();
}


class _MessagePageState extends State<MessagePage> {
  void initState() { 
        super.initState();
        PushNotificationService.messageStream.listen((message) { 
          print('******MyApp: $message');
    });
  }
   @override
   Widget build(BuildContext context) {
       return Container(
         color: Colors.teal.shade100,
         child: Dialog(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8)
           ),
           child: Flexible(
             child: Stack(
               clipBehavior: Clip.none,
               alignment: Alignment.topCenter,
               children: [
                 Container(
                   height: 220,
                   child: Padding( 
                     padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                     child: Column(
                       children: [
                         Text(titulo, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center),
                         SizedBox( height: 20,),
                         RaisedButton(
                           color: Colors.lightGreen,
                           onPressed: (){
                             Navigator.pop(context);
                           //Navigator.pushNamed(context,'home2');
                         },
                         child: Text('Aceptar',style: TextStyle(color: Colors.white),),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Positioned(child: CircleAvatar(
                   backgroundColor: Colors.indigo[900],
                   radius: 60,
                   child: Icon(Icons.notifications_none_outlined,size: 50,color: Colors.lightGreen,),
                 ),
                 top: -60,
                 ),
               ],
             ),
           ),
           ),
       );
  }
}