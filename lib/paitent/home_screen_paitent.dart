import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/Notifiction_page.dart';
import 'package:tabebk/Page_Four.dart';
import 'package:tabebk/Page_THree.dart';
import 'package:tabebk/call_support.dart';
import 'package:tabebk/doctor/doctor_medicines.dart';
import 'package:tabebk/paitent/Pait_add_schedule.dart';
import 'package:tabebk/paitent/Pait_schedule.dart';
import 'package:tabebk/paitent/pait_medicines.dart';

import 'PaitEmergency.dart';


class HomeScreenPaitent extends StatefulWidget
{
final  int id;
final String name ;

  const HomeScreenPaitent({Key? key, required this.id,required this.name}) : super(key: key);
  @override
  _HomeScreenPaitentState createState() {
    return _HomeScreenPaitentState(id: id ,name:name );
  }
}

class _HomeScreenPaitentState extends State<HomeScreenPaitent> {
  final  int id;
  final String name ;

   _HomeScreenPaitentState({Key? key, required this.id,required this.name}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
drawer: SafeArea(
  child:Drawer(child: Container(color: Colors.lightBlueAccent,child: Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text('Name : $name',style: TextStyle(color:Colors.white),),
        SizedBox(height: 50.0,),
        Text('Number :  $id',style: TextStyle(color:Colors.white),),
        SizedBox(height: 50.0,),
        Row(children: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SupportView()));
          }, icon: Icon(Icons.contact_support_outlined,color: Colors.white,)),
          SizedBox(width: 20.0,),
          Text('Support ',style: TextStyle(color:Colors.white),),





        ],),
        SizedBox(height: 300.0,),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: Colors.orange),
          child: TextButton(

              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }, child: Row(children: [
                Icon(Icons.exit_to_app,color: Colors.white,),
              SizedBox(width: 20.0,),
              Text('Logout',style:TextStyle(color: Colors.white),),

          ],))
        )

    ],),
  ),),),
),
      appBar:AppBar(backgroundColor: Colors.lightBlueAccent,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(child: Text('Main Menu',)),
      ),
      actions: [

      ],
      elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.lightBlueAccent,Colors.lightBlue],
          begin: Alignment.topLeft,
            end: Alignment.bottomRight
              ,stops: [0.5,1]
          )
        ),
        width: double.infinity,
        // color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  // height: 1000.0,
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(55.0),color: Colors.white,
                    border: Border.all(color:Colors.black)


                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient:LinearGradient(colors:[Colors.lightBlueAccent,Colors.blue],
                            begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                                ,stops: [0.7,1]
                            ),

                          ),
                          height: 150.0,
                          width: double.infinity,
                          // color: Colors.lightBlueAccent,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Emergency',style:TextStyle(fontSize: 25.0,color: Colors.white),),
                              ),
                              SizedBox(height: 30.0,),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                  IconButton(onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PaitEmergency(id: id))
                                    );
                                  }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                ],),
                              ),
                            ],
                          ),
                        ),),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 150.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient:LinearGradient(colors:[Colors.lightBlueAccent,Colors.blue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                                ,stops: [0.7,1]
                            ),

                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Scheduled',style:TextStyle(fontSize: 25.0,color: Colors.white),

                                ),
                              ),
                              SizedBox(height: 30.0,),
                              Container(
                                width: double.infinity,
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PaitSchedule(id: id,)));}, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 150.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient:LinearGradient(colors:[Colors.lightBlueAccent,Colors.blue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                                ,stops: [0.7,1]
                            ),

                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Add appointment',style:TextStyle(fontSize: 25.0,color: Colors.white),),
                              ),
                              SizedBox(height: 30.0,),
                              Container(
                                width: double.infinity,
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: () async {

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaitAddSchedule(id: id,)));}, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 150.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient:LinearGradient(colors:[Colors.lightBlueAccent,Colors.blue],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                                ,stops: [0.7,1]
                            ),

                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Medication',style:TextStyle(fontSize: 25.0,color: Colors.white),),
                              ),
                              SizedBox(height: 30.0,),
                              Container(
                                width: double.infinity,
                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaitentMedicines(id: id)));
                                      }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),




                    ],
                  ),
                ),

              ],

            ),
          ),
        ),
      )
    );
  }
}
