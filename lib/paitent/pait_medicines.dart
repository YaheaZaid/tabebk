import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';


class PaitentMedicines extends StatefulWidget {
  final  int id;
  const PaitentMedicines({Key? key, required this.id}) : super(key: key);
  @override
  _PaitentMedicinesState createState() {
    return _PaitentMedicinesState(id: id);
  }
}

class _PaitentMedicinesState extends State<PaitentMedicines> {
  final  int id;
  List userProfilesList = [];

  _PaitentMedicinesState({Key? key, required this.id}) ;

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(

        child: Container(

          width: double.infinity,
          color: Colors.lightBlueAccent,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back,color: Colors.white,)),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Text('medication scheduling ',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(

                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.black)),
                  height: 600.0,
                  child: Column(

                    children: [
                      SizedBox(height: 80.0,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,

                          decoration: BoxDecoration(color: Colors.blueGrey),
                          child: Column(children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Name ',style: TextStyle(color: Colors.white),),
                                  Text('Hospital ',style: TextStyle(color: Colors.white),),
                                  Text('Notes ',style: TextStyle(color: Colors.white),),



                                ],
                              ),

                            ),
                            Divider(color: Colors.white,),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 300.0,
                                  child: ListView.separated(
                                      itemBuilder: (context,index){
                                        return BuildData(userProfilesList[index]);
                                      }, separatorBuilder:( context,index)=>SizedBox(height: 40.0,), itemCount:userProfilesList.length)),
                            )




                          ],),
                        ),
                      ),

                      SizedBox(height: 80.0,)





                    ],
                  ),
                ),
              ),

            ],),
          ),
        ),
      ),

    );
  }
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getMedicines(id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
}

Widget BuildData(var Data)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('${Data['name']}',style: TextStyle(color: Colors.white),),
      Text('${Data['Hosptal']}',style: TextStyle(color: Colors.white),),
      Text('${Data['note']}',style: TextStyle(color: Colors.white),),



    ],
  ),

);