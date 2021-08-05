import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:loboc_avisos/models/aviso.dart';
import 'package:loboc_avisos/pages/message_page.dart';
import 'package:loboc_avisos/pages/view_notification.dart';
import 'package:loboc_avisos/services/push_notification_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //FIREBASE 
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "avisos_lc";
  List<Aviso> avisoList = <Aviso>[];


  @override
  // ignore: must_call_super
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);

  
        //context
        PushNotificationService.messageStream.listen((message) { 
          print('******MyApp: $message');
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()),);
    });

  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notificaciones", style: TextStyle(fontWeight: FontWeight.w200)),
        backgroundColor: Colors.indigo.shade900,
        centerTitle: true,
        
      ),
      body: Container(
        color: Colors.teal.shade100,
        child: Column(
          children: <Widget>[
            Visibility(
              visible: avisoList.isEmpty,
              child: Center(                
                child: Container(
                  height: _screenSize.height*0.65,
                  alignment: Alignment.center,
                  child: Column(  
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
                ),
              ),
            ),

            Visibility(
              visible: avisoList.isNotEmpty,
              child: Flexible(
                  child: FirebaseAnimatedList(                    
                      query: _database.reference().child('avisos_lc'),
                      //reverse: true,
                        itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AvisoView(avisoList.reversed.toList()[index])));
                                },
                               leading: Padding(
                                 padding: const EdgeInsets.only(top:6.0, bottom: 5.0),
                                 child: Icon(Icons.notifications_none_outlined,size:30.0,color: Colors.amber),
                               ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    avisoList.reversed.toList()[index].titulo,
                                    style: TextStyle(
                                        fontSize: 20.0, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                trailing: Text(
                                  avisoList.reversed.toList()[index].fechaPublicacion,
                                  style: TextStyle(fontSize: 14.0, color: Colors.blueGrey),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0,top: 4.0),
                                  child: Text(avisoList.reversed.toList()[index].descripcion, style: TextStyle(fontSize: 18.0),),
                               ),
                              ),
                            ),
                          );
                      })),
            )
          ],
        ),
      ),
    );
  }

   _childAdded(Event event) {
    setState(() {
      avisoList.add(Aviso.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedAviso = avisoList.singleWhere((aviso){
      return aviso.key == event.snapshot.key;
    });

    setState(() {
      avisoList.removeAt(avisoList.indexOf(deletedAviso));
    });
  }

  void _childChanged(Event event) {
    var changedAviso = avisoList.singleWhere((aviso){
      return aviso.key == event.snapshot.key;
    });

    setState(() {
      avisoList[avisoList.indexOf(changedAviso)] = Aviso.fromSnapshot(event.snapshot);
    });
  }
  
}


//avisoList.reversed.toList()[index]