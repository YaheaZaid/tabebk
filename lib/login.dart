
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:appinio_animated_toggle_tab/appinio_animated_toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabebk/doctor/home_screen_doctor.dart';
import 'package:tabebk/paitent/home_screen_paitent.dart';
import 'package:tabebk/support/home_screen_support.dart';
import 'package:tabebk/doctor/signup_doctor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  void initState()
  {
    super.initState();
  }
  var nnn;

  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  int currentIndex = 0;
  String lo= 'img/doc.jpg';
   late bool exist ;
  @override
  void dispose()
  {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
        Column(
        children: [
        Container(
        width: double.infinity,
            height: 350.0,
            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.only(bottomStart:Radius.circular(250.0),
              bottomEnd: Radius.circular(250.0),

            ),color:Colors.blue,


            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [],),
            )),
        Spacer(),
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.blue[300],

        ),
        ],),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Tabebak",style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: 20.0,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: double.infinity,
                    height:600.0 ,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(75.0),color: Colors.white,border: Border.all(color: Colors.black,width: 2)),
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: AppinioAnimatedToggleTab(
                                    duration: const Duration(milliseconds: 150),
                                    callback: (int index) {
                                      setState(() {
                                        currentIndex = index;
                                        if (index==0){
                                          lo='img/doc.jpg';

                                        }
                                        else if (index==1){
                                          lo = 'img/sec.jpg';
                                        }
                                        else{
                                          lo = 'img/support.jpg';
                                        }
                                      });
                                    },
                                    tabTexts: const [
                                      'Hospital',
                                      'Paitent',
                                      'Support',
                                    ],
                                    height: 40,
                                    width: 220,
                                    boxDecoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),

                                    ),
                                    animatedBox: Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFc3d2db).withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: const Offset(2, 2),
                                          ),
                                        ],
                                        color: Colors.blueAccent,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    activeStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    inactiveStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Image(
                                    image: AssetImage(lo)),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _emailcontroller,
                                  decoration: InputDecoration(

                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    filled: true,
                                    hintText: 'Enter Number',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please Fill Password Input';
                                    }
                                  },),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  obscureText: _isObscure,
                                  controller: _passwordcontroller,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure ? Icons.visibility_off : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    filled: true,
                                    hintText: 'Enter Number',
                                  ),
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Enter Password';
                                    }

                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      final DocumentReference result =
                                      await Firestore.instance.collection('Paitent').document(_emailcontroller.text);
                                      result.get().then((snapshot) {
                                        nnn = snapshot.data['name'].toString();
                                        print(nnn);
                                      });
                                      if(_formkey.currentState!.validate()){
                                        if (currentIndex==1){
                                          DocumentSnapshot result = await Firestore.instance.collection("Paitent").document(_emailcontroller.text).get();
                                          DocumentSnapshot ds = await Firestore.instance.collection('Paitent').document(_emailcontroller.text).get();
                                          {
                                            if(result.exists && ds.data['password'].toString() ==_passwordcontroller.text.toString() ) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context)  {
                                                  print(nnn);
                                                  return HomeScreenPaitent(id: int.parse(_emailcontroller.text), name: nnn.toString() );
                                                }),
                                              );
                                            } else {
                                              showAlertDialog(context);
                                            }
                                          }
                                          ;
                                        }
                                        else if (currentIndex==0){
                                          DocumentSnapshot result = await Firestore.instance.collection("Doctor").document(_emailcontroller.text).get();
                                          DocumentSnapshot ds = await Firestore.instance.collection('Doctor').document(_emailcontroller.text).get();
                                          print(result.exists);
                                          {
                                            if(result.exists && ds.data['password'].toString() ==_passwordcontroller.text.toString() ) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => HomeScreenDoctor(id: int.parse(_emailcontroller.text))),
                                              );
                                            } else {
                                              showAlertDialog(context);
                                            }
                                          }
                                          ;
                                        }
                                        else if(currentIndex==2){
                                          DocumentSnapshot result = await Firestore.instance.collection("Support").document(_emailcontroller.text).get();
                                          DocumentSnapshot ds = await Firestore.instance.collection('Support').document(_emailcontroller.text).get();{
                                            if(result.exists && ds.data['password'].toString() ==_passwordcontroller.text.toString() ) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => SupportMenu(id: int.parse( _emailcontroller.text.toString()),)),
                                              );
                                            } else {
                                              showAlertDialog(context);
                                            }
                                          }
                                        }
                                      }
                                    },
                                    child:Text("Login") ,
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.lightBlue,
                                        minimumSize: Size(193, 43)
                                    )
                                ),
                                if (lo=='img/doc.jpg')
                                SizedBox(
                                  height: 20.0,
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    )
                    ,),

                ),




              ],

            ),
          ),
        ),

          ],
        ),
      )
    );
  }
  Widget BackgroundImg(){
    return Container(
      decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage("img/login.jpg"),
              fit: BoxFit.cover)),);

  }
  Future<String> checkExist(String name) async{
    var a = await Firestore.instance.collection('Paitent').document(name).get();
    if(a.exists){
      print('Exists');
      return "true";
    }
    if(!a.exists){
      print('Not exists');
      return "false";
    }
    return "false";

  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("حسنا"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("يوجد لديك خطأ"),
      content: Text("تأكد منرقم الدخول أو  كلمة المرور "),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
