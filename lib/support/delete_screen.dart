import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  String select ='1' ;
  var Value;
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: globalKey,
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

                ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 600.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),border: Border.all(color: Colors.black),color: Colors.white),


              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0
                      ,horizontal: 20.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: Colors.blueAccent)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0),),

                          hintText: "Enter Number",hintStyle: TextStyle(color: Colors.blue,)),),


                  )
                  ,
                ),
                SizedBox(height: 50.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          child: Radio(
                              value: 1,
                              groupValue: Value,
                              onChanged: (value){
                                setState(() {
                                  Value=value;
                                  select= "Doctor";

                                });
                              }
                          ),
                        ),
                        Text("Hospital ",style: TextStyle(fontSize: 20.0,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),)

                      ],),
                      Row(children: [
                        Radio(

                            value: 2,
                            groupValue: Value,
                            onChanged: (value){
                              setState(() {
                                Value=value;
                                select= "Paitent";


                              });
                            }
                        ),
                        Text("Paitent",style: TextStyle(fontSize: 20.0,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold))

                      ],),

                    ],),


                ),
                SizedBox(height: 150.0,),
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
                        borderRadius: BorderRadius.circular(30.0),color: Colors.redAccent[700]),
                    child: MaterialButton(onPressed: (){

                      if (select!='1'&& number.text.toString().isNotEmpty)
                        {
                          var docRef = Firestore.instance.collection(select);
                          docRef.document(number.text).delete();
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(

                              content: Text("Delete Complete"),
                              actions: [
                                CupertinoDialogAction(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK"),)

                              ],

                            );
                          }
                          );

                          }
                      else {
                        SnackBar Mysnackbar = SnackBar(

                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Fill Blanks'),

                              ],));

                        globalKey.currentState!.showSnackBar(Mysnackbar);


                      }


                    },child: Text("Delete",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,))



              ],),
            ),
          )

        ],),
      ),),


    );
  }
}
