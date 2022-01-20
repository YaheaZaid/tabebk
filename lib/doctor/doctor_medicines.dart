
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';
class DoctorMedicines extends StatefulWidget {
  final  int id;

  const DoctorMedicines({Key? key, required this.id}) : super(key: key);



  @override
  _DoctorMedicinesState createState() => _DoctorMedicinesState(id: id);
}

class _DoctorMedicinesState extends State<DoctorMedicines> {

  DatabaseManager db = DatabaseManager();
  final  int id;

  _DoctorMedicinesState({Key? key, required this.id}) ;
  var select ;
  var Value;
  var Hosptal;

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: Container(
        color: Colors.lightBlueAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,)
                ,Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Medcine Schedule",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),

                ),
            SizedBox(
              width: 20,
            )],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 600.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),border: Border.all(color: Colors.black),color: Colors.white),


              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Medicament Name',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0
                      ,horizontal: 10.0
                  ),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.blueAccent)),
                    child: TextFormField(
                      controller: name,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          hintText: "Medicament Name",hintStyle: TextStyle(color: Colors.grey,)),),
                  )
                  ,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Paitent Number',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0
                      ,horizontal: 10.0
                  ),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.blueAccent)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          hintText: "insert number",hintStyle: TextStyle(color: Colors.grey,)),),
                  )
                  ,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Note',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0
                      ,horizontal: 10.0
                  ),
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.blueAccent)),
                    child: TextFormField(
                      controller:note,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          hintText: "note",hintStyle: TextStyle(color: Colors.grey,)),),
                  )
                  ,
                ),
                SizedBox(height: 50.0,),
                Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),color: Colors.green[500]),
                    child: MaterialButton(onPressed: () async {
                      final DocumentReference result =
                      await Firestore.instance.collection('Doctor').document(id.toString());
                      result.get().then((snapshot) {
                        Hosptal = snapshot.data['hospital'].toString();});
                      db.addMedicines(int.parse(number.text), name.text, Hosptal, note.text);
                    },child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,))



              ],),
            ),
          )

        ],),
      ),),


    );
  }
}