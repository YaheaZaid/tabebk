import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';

class SignUp extends StatefulWidget
{
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController hospitalname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  DatabaseManager db = new DatabaseManager();

  var path ;
  late Uint8List file1;
  var name ;
  //File? file;
  final FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
      body: SafeArea(

        child: Column(children: [

          Container(width: double.infinity,
            height: 500.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(150.0),
                  bottomStart: Radius.circular(150.0)
              ),
            ),
            child: Column(children: [

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(

                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text("Tabebak",
                        style: TextStyle(color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Spacer(flex: 1),

                  ],),
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('img/doc.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.grey[300]
                      ,boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),]
                  ),
                  child: TextFormField(
                    controller: hospitalname,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'اسم المستشفى',hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,color: Colors.blueGrey[700]),
                        border:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(30.0))),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.grey[300]
                      ,boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),]
                  ),
                  child: TextFormField(
                    controller: phonenumber,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'رقم التواصل',hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[700]),

                        border:OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.blueGrey)
                            ,
                            borderRadius: BorderRadius.circular(30.0))),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),color: Colors.grey[300]
                      ,boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),]
                  ),
                  child: TextFormField(
                    controller: email,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'البريد الالكتروني',hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey[700]),

                        border:OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.blueGrey)
                            ,
                            borderRadius: BorderRadius.circular(30.0))),),
                ),
              ),




            ],),
          ),
          Spacer(),
          Container(width: double.infinity,
            height: 120.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:BorderRadiusDirectional.only(topStart: Radius.circular(170.0),topEnd: Radius.circular(170.0)

              ),

            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:   Column(children: [

                Container(
                    width: 200.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0),color: Colors.orange[700]),
                    child: MaterialButton(onPressed: (){
                      if (phonenumber.text.isNotEmpty&&email.text.isNotEmpty&&hospitalname.text.isNotEmpty){
                        db.askNewHos(phonenumber.text, email.text, hospitalname.text);
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
                        );

                      }
                      else{

                        SnackBar Mysnackbar = SnackBar(

                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('أملأ الخيارات'),

                              ],));
                        globalKey.currentState!.showSnackBar(Mysnackbar);

                      }
                    },child: Text("تسجيل",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,)),
              ],),
            ),
          ),
        ],),
      ),

    );



  }

  Future <void>upload (String filepath,String filename) async {
    //File file =File(filepath);

    try {
      //storage.ref().child('test/$path').putData(file);
    }
    catch (e){

    }

}
}



