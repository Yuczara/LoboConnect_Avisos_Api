import 'package:flutter/material.dart';
import 'package:loboc_avisos/pages/detalle_aviso.dart';
import 'package:loboc_avisos/pages/home_api.dart';
import 'package:loboc_avisos/pages/message_page.dart';
import 'package:loboc_avisos/services/push_notification_service.dart';

 var mensaje;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(MyApp());
}  
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp>{
     @override

     //COMPROBAR SI HAY NOTIFICACIONES
     void initState() { 
        super.initState();
        //context
        PushNotificationService.messageStream.listen((message) { 
           print('******MyApp: $message');
           Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()));
    });
  }
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home',
      initialRoute: 'home2',
      routes: {
        //'home': (_) => HomePage(),
        'home2':(_) => HomeApiPage(),
        'detalle':(_)=> AvisoDetalle(),
      },
      
    );
  }
  
}