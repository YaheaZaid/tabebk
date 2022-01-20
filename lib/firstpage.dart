import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (ctx) => Stack(

              children: [
                BackgroundImg(),
                Container(
                    child: Align(
                      alignment: Alignment.topCenter,


                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text('Tabebk',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold

                          )
                          ,),
                      ),
                    )),

               Container(
                   alignment: AlignmentDirectional.centerStart,
                   child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_pk5mpw6j.json')),

                Container(
                    alignment: Alignment.bottomCenter,


                    child: Align(
                      alignment: Alignment.bottomCenter,

                      child: RaisedButton.icon(
                        icon: Lottie.network('https://assets2.lottiefiles.com/packages/lf20_vetmmwih.json',
                            height: 26,
                        width: 36),
                        onPressed: ()  {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                        },
                        color: Colors.orange,
                        shape: StadiumBorder(),
                        label: Text('Start'),
                        textColor: Colors.white,
                      ),
                    ))
              ],


          ),
        ),
      ),
    );





  }

  Widget BackgroundImg(){
    return Container(
      decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage("img/back.png"),
              fit: BoxFit.cover)),);

  }
 }
