import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';
import 'package:url_launcher/url_launcher.dart';



class EmergencyMenu extends StatefulWidget {
  final  int id;
  const EmergencyMenu({Key? key, required this.id}) : super(key: key);

  @override
  _EmergencyMenuState createState() => _EmergencyMenuState(id: id);
}

class _EmergencyMenuState extends State<EmergencyMenu> {
  final  int id;
  List userProfilesList = [];

  _EmergencyMenuState({Key? key, required this.id}) ;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      //updateListView();
    });
  }
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            fetchDatabaseList();
            return Future.delayed(Duration(seconds: 1));
          },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [const  Color(0xffd50000),const Color(0xffef5350)]
                      , stops:[0.0,0.8]
                  )
              ),
              child: SingleChildScrollView(
                child: Column(children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,))
                        ,Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text("Emegency",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
                        )
                     

                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        height: 600.0,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(35.0),border: Border.all(color: Colors.black,width: 2)),

                        child: SingleChildScrollView(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 550.0,
                                  child: ListView.separated(itemBuilder: (context,index)=>Builddata(userProfilesList[index]), separatorBuilder: (context,index)=>SizedBox(height: 10.0,), itemCount: userProfilesList.length)),
                            )

                          ],),
                        ),)

                    ],),
                  ),

                ],),
              )

          ),
        ),
      ),


    );
  }
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getEmergencyCall(id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
}


Widget Builddata(var Data)=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const  Color(0xffd50000),const Color(0xffef5350)]
            , stops:[0.0,0.8]
        )
    ),
    height: 250.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Name :${Data['name']} ",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
        Text("Number :${Data['number']}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
        Column(
          children: [
            Text("Location",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(50.0),),
              child: CircleAvatar(
                  radius: 40.0,

                  backgroundColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                    child: IconButton(onPressed: (){
                      googleMap(Data['latitude'].toString(), Data['longitude'].toString());

                    }, icon: Icon(Icons.add_location_outlined,size: 40.0,color: Colors.black,)),
                  )),
            ),
          ],
        )
        ,Text("Note : ${Data['note']} ",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
        Text("Call ${Data['call']}",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),

      ],),),
);
void googleMap(String _latitude,String _longitude) async {
  String googleUrl =
      "https://www.google.com/maps/search/?api=1&query=$_latitude,$_longitude";

  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else
    throw ("Couldn't open google maps");
}