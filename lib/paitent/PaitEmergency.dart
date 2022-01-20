
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:geolocator/geolocator.dart';

class PaitEmergency extends StatefulWidget {
  final  int id;

  const PaitEmergency({Key? key, required this.id}) : super(key: key);

  @override
  _PaitEmergencyState createState() => _PaitEmergencyState( id: id);
}

class _PaitEmergencyState extends State<PaitEmergency> {
  final  int id;

  _PaitEmergencyState({Key? key, required this.id}) ;
  double _latitude = 0;
  double _longitude = 0;
  var respnse ;
  var name ;
  var Number ;
  DatabaseManager _databaseManager = new DatabaseManager();
  int _val = 1;
  String ?note;
  TextEditingController _notecontroller = TextEditingController();
  bool _value = false;
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
     _latitude = position.latitude;
     _longitude = position.longitude;


  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();


    return Builder(
      builder: (ctx) => MaterialApp(

        home: WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            key: globalKey,

              body: SafeArea(
                child: Stack(
                  children: [

                    BackgroundImg(),
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,)
                    ,Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RaisedButton.icon(
                                icon: Icon(
                                    Icons.location_on_rounded
                                ),
                                onPressed: () async {

                                   getCurrentLocation();
                                if(_latitude != null&&_longitude != null){
                                  SnackBar Mysnackbar = SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.add_location,color: Colors.white,),
                                          Text('Locaton Saved'),
                                          Icon(Icons.check,color: Colors.white,)

                                        ],));
                                  Future.delayed(Duration(milliseconds: 2000), () {
                                    globalKey.currentState!.showSnackBar(Mysnackbar);
                                  });
                                  }

                                },
                                color: Colors.orange,
                                shape: StadiumBorder(),
                                label: Text('          Get Your Location             '),
                                textColor: Colors.white,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Can you Call ?"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Radio(
                                value: 1,
                                groupValue: _val,
                                onChanged: (value){
                                  setState(() {
                                    _val= value as int;
                                    _value = true;

                                  });
                                }

                            ),
                            SizedBox(width: 10.0,),
                            Text("Yes")

                          ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Radio(
                                value: 2,
                                groupValue: _val,
                                onChanged: (value){
                                  setState(() {
                                    _val= value as int;
                                    _value = false;

                                  });
                                }

                            ),
                            SizedBox(width: 10.0,),
                            Text("No")

                          ],),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: TextField(
                            controller: _notecontroller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Notes',

            ),
          ),
                        ),
                        Container(
                            child: Align(
                              alignment: Alignment.bottomCenter,

                              child: RaisedButton.icon(

                                icon: Icon(
                                    Icons.input_rounded
                                ),
                                onPressed: () async {
                                  if(_longitude.toString().isEmpty){
                                    SnackBar Mysnackbar = SnackBar(

                                        content: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Fill The Blanks'),

                                          ],));
                                    globalKey.currentState!.showSnackBar(Mysnackbar);
                                  }
                                  final DocumentReference result =
                                  await Firestore.instance.collection('Paitent').document(id.toString());
                                  result.get().then((snapshot) {
                                    name = snapshot.data['name'].toString();});
                                  final DocumentReference result2 =
                                  await Firestore.instance.collection('Paitent').document(id.toString());
                                  result2.get().then((snapshot) {
                                    Number = snapshot.data['number'].toString();});
                                      print(name);
                                      print(Number);

                                 if (_value =false)
                                   respnse= 'No';
                                 else
                                   respnse= 'Yes';

                                 _databaseManager.emergencyCall(id.toString(), name, Number, _longitude, _latitude, respnse.toString(), _notecontroller.text);
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text("Your Reqeust Has been sent"),
                                      content: Text("Please Wait We will Contact With You Soon..."),
                                      actions: [
                                        CupertinoDialogAction(onPressed: (){Navigator.pop(context);},child: Text("Ok"),)

                                      ],

                                    );

                                  });
                                },
                                color: Colors.orange,
                                shape: StadiumBorder(),
                                label: Text('           Send             '),
                                textColor: Colors.white,
                              ),
                            ))

                      ],

                    )
                  ],
                     ),
              ),

      ),
        )
      ),
    );
  }
  Widget BackgroundImg(){
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage("img/background.jpg"),
              fit: BoxFit.cover)
      ),
    );

  }

Future<bool> _onBackPressed() async {
    Navigator.pop(context);
    return true;

  }
}
