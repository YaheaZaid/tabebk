import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';
String name= "انس حواس " ;
String time ="1h ago";
String message= "لقد تم  اخذ موعد  المستشفى البشير ولقد زرته  اليوم وفعلا لم  انتظر شكرا جزيلا";

class AddSupport extends StatefulWidget {
  final  int id;
  const AddSupport({Key? key, required this.id}) : super(key: key);

  @override
  _AddSupportState createState() => _AddSupportState(id: id);
}

class _AddSupportState extends State<AddSupport> {
  final  int id;

  _AddSupportState({Key? key, required this.id}) ;
  DatabaseManager db =new DatabaseManager();
  var select ;
  var Value;
  var Hosptal;
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController Number = TextEditingController();
  TextEditingController email = TextEditingController();
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
                ,Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Add Support",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),

                ),
                SizedBox(
                  width: 20,
                )
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Number Support',
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

                      controller: Number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          hintText: "Number",hintStyle: TextStyle(color: Colors.grey,)),),
                  )
                  ,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Email',
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
                      controller: email,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                          hintText: "email",hintStyle: TextStyle(color: Colors.grey,)),),
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
                      if (email.text.isNotEmpty && Number.text.isNotEmpty){
                        db.addSSupport(id, email.text, Number.text);
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(

                            content: Text("تمت الاضافة"),
                            actions: [
                              CupertinoDialogAction(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text("حسنا"),)

                            ],

                          );
                        }
                        );}
                      else{
                        SnackBar Mysnackbar = SnackBar(

                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('أملأ الخيارات'),

                              ],));
                        globalKey.currentState!.showSnackBar(Mysnackbar);

                      }
                    },child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,))



              ],),
            ),
          )

        ],),
      ),),


    );
  }
}
