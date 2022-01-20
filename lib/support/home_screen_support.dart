import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/support/Requestmesseage_screen.dart';
import 'package:tabebk/support/add_hospital.dart';
import 'package:tabebk/support/delete_screen.dart';
import 'package:tabebk/support/viewmessage_screen.dart';

class SupportMenu  extends StatefulWidget {
  final  int id;
  const SupportMenu({Key? key, required this.id}) : super(key: key);

  @override
  _SupportMenuState createState() => _SupportMenuState(id: id);
}

class _SupportMenuState extends State<SupportMenu> {
  final  int id;

  _SupportMenuState({Key? key, required this.id}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Container(color: Colors.lightBlueAccent,child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 50.0,),

            Text('$idرقم المستخدم',style: TextStyle(color:Colors.white),),
            SizedBox(height: 50.0,),

            SizedBox(height: 50.0,),

            SizedBox(height: 250.0,),
            Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: Colors.orange),
                child: TextButton(

                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }, child: Row(children: [
                  Icon(Icons.exit_to_app,color: Colors.white,),
                  SizedBox(width: 40.0,),
                  Text('تسجيل الخروج ',style:TextStyle(color: Colors.white),),

                ],))
            )

          ],),
      ),),),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 40.0,right: 30),
          child: Center(child: Text("Menu")),
        ),


      ),
      body: Container(

        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlueAccent,
        child:SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:   Container(

                width: double.infinity,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),color: Colors.white,border: Border.all(color: Colors.black,width: 1)),

                child: Column(children: [

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(width: double.infinity,
                      height: 220,
                      color: Colors.lightBlueAccent,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Add Hospital",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),


                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(width: double.infinity,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Addhospital()));
                                  }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,size: 30.0,)),
                              ],
                            ),
                          ),
                        )


                      ],),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(width: double.infinity,
                      height: 220,
                      color: Colors.lightBlueAccent,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Delete User",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),


                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(width: double.infinity,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteScreen()));
                                  }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,size: 30.0,)),
                              ],
                            ),
                          ),
                        )


                      ],),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(width: double.infinity,
                      height: 220,
                      color: Colors.lightBlueAccent,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Add Support",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),


                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(width: double.infinity,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSupport(id: id,)));
                                  }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,size: 30.0,)),
                              ],
                            ),
                          ),
                        )


                      ],),
                    ),
                  ),










                ],),),
            ),




          ],),
        ),
      ),

    );
  }
}
