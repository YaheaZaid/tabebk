import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';

class Addhospital extends StatefulWidget
{
  const Addhospital({Key? key}) : super(key: key);

  @override
  _AddhospitalState createState() => _AddhospitalState();
}

class _AddhospitalState extends State<Addhospital> {
  DatabaseManager db = new DatabaseManager();
  TextEditingController myController = new TextEditingController();


  List<String> HosList = <String>["فيصل","جامعة الاردنية","الزرقاء الحكومي","الوطني السكري ","اربد  الحكومي",];
  List<String> SecList = <String>[];
  List<String> DateList = <String>[];
  var dropdown;
  var dropdown1;
  var dropdown2;
  var dropdown3;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body:SafeArea(child: Container(
        color: Colors.lightBlueAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,)
                ,Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,right: 100),
                  child: Text("Add Hospital",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),

                ),
                ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 550.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),border: Border.all(color: Colors.black),color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Hospital Name ",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15.0,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(width: 300.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15.0),color: Colors.grey[100],border: Border.all(color: Colors.lightBlueAccent,width: 2)),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton<String>(

                            dropdownColor: Colors.white,

                            style: TextStyle(fontSize: 23.0,color: Colors.blue),
                            iconSize: 30.0,
                            icon: Icon(Icons.arrow_drop_down,color: Colors.blue,),


                            onChanged: (String ?newvalue){
                              setState(() {
                                dropdown1 = newvalue!;
                              });}
                            ,

                            value: dropdown1,
                            items: HosList.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );},



                            ).toList(),),
                        ),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(

                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(context: context, builder: (ctx) => _buildBottomSheet(ctx,SecList));

                          });
                        },
                        child: const Text('Add Section '),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(


                        onPressed: () => showModalBottomSheet(
                            context: context, builder: (ctx) => _buildBottomSheet(ctx,DateList)),
                        child: const Text('Add Date '),
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                        width: 240.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30.0),color: Colors.greenAccent[700]),
                        child: MaterialButton(onPressed: () async {
                          Random rnd = new Random();
                          var next = rnd.nextInt(99999999);
                          print(dropdown1.toString());
                          db.addNewHospital(dropdown1.toString(), next, DateList,SecList);
                          if(DateList.isNotEmpty && SecList.isNotEmpty )
                          {
                            showDialog(context: context, builder: (context) {
                            return AlertDialog(

                              content: Text("Done"),
                              actions: [
                                CupertinoDialogAction(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK"),)

                              ],

                            );
                          }
                            );}
                          else{
                            SnackBar Mysnackbar = SnackBar(

                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Fill Blanks'),

                                  ],));
                            globalKey.currentState!.showSnackBar(Mysnackbar);


                          }

                        },child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,))

                  ],),
              ),
            ),
          )

        ],),
      ),),

    );
  }
  Container _buildBottomSheet(BuildContext context,List list) {
    return Container(
      height: 300,
      padding:  EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: <Widget>[
           ListTile(title: Text('Add',textAlign:TextAlign.center ,)),
             TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),

                labelText: 'Enter here',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                  onPressed: () {
                    SnackBar Mysnackbar = SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text('Add Complete ${myController.text}'),
                            IconButton(onPressed: () {
                              list.removeLast();
                            }, icon: Icon(Icons.delete,color: Colors.red),
                            )

                          ],));
                    globalKey.currentState!.showSnackBar(Mysnackbar);

                    list.add(myController.text);
                    myController.clear();
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
