import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';
class DocSchedule extends StatefulWidget {
  final  int id;
  const DocSchedule({Key? key, required this.id}) : super(key: key);

  @override
  _DocScheduleState createState() {
    return _DocScheduleState(id: id);
  }
}

class _DocScheduleState extends State<DocSchedule> {
  final globalKey = GlobalKey<ScaffoldState>();

  final  int id;
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getHosShedule(id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
  _DocScheduleState({Key? key, required this.id}) ;
  List userProfilesList=[];
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SafeArea(

        child: RefreshIndicator(
          onRefresh: () {
            fetchDatabaseList();
            return Future.delayed(Duration(seconds: 1));
          },
          child: Container(

            width: double.infinity,
            color: Colors.lightBlueAccent,

            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back),color: Colors.white,)
                    ,Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Schedule",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),

                    ),
                    SizedBox(
                      width: 20,
                    )],),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 550.0,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.black)),
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        SizedBox(height: 50.0,),

                        Container(
                            height: 500.0,
                            child: ListView.separated(itemBuilder: (context,index)=>Builddata(userProfilesList[index]), separatorBuilder: (context,index)=>SizedBox(height: 10.0,), itemCount: userProfilesList.length))
                      ],
                    ),
                  ),
                ),
              ),

            ],),
          ),
        ),
      ),

    );
  }
  Widget Builddata(var data)=>Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(children: [
      Expanded(
        child: Container(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(" Paitent Number \n${data['name']}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 10),),
            )),
      ),
      SizedBox(width: 10.0,),
      Expanded(flex: 2,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.lightBlueAccent)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text("Section :  ${data['section']}",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                  Text(" Date :  ${data['date']}",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                ],),
                IconButton(onPressed: (){
                  Firestore.instance.collection("Doctor").document(id.toString()).collection('Schedule').document(data['name']).delete();
                  Firestore.instance.collection("Paitent").document(data['name']).collection('Schedule').document(id.toString()).delete();
                  DatabaseManager db = new DatabaseManager();
                  db.addPaitNotifcation(data['Docid'], data['name'],data['name'] ,data['result'] ,data['section'] ,data['date'] ,data['Hosptal'] );

                  SnackBar Mysnackbar = SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Succful Deleted '),



                        ],));
                  globalKey.currentState!.showSnackBar(Mysnackbar);
                  fetchDatabaseList();

                }, icon: Icon(Icons.delete,color: Colors.red,))
              ],),
          ),
        ),
      )


    ],),
  );
}


