import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';





class RequestScreen extends StatefulWidget {
  final  int id;
  const RequestScreen({Key? key, required this.id}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState(id: id);
}

class _RequestScreenState extends State<RequestScreen> {
  List userProfilesList=[];
  final  int id;
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }
  _RequestScreenState({Key? key, required this.id}) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child: Container(
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
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text("عرض الطلبات",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),

                ),
               SizedBox(width: 20,)],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 600.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),border: Border.all(color: Colors.black),color: Colors.white),


              child: Column(children: [
                SizedBox(height: 100.0,),
                Container(
                    height: 400.0,
                    child: ListView.separated(itemBuilder: (context,index)=>Builddata(userProfilesList[index]), separatorBuilder: (context,index)=>SizedBox(height: 30.0,), itemCount:userProfilesList.length))

              ],),
            ),
          )

        ],),
      ),),

    );
  }
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getReqHos(id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
}


Widget Builddata(var Data)=>Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,
    color: Colors.blue,
    child: Column(children: [
      Container(
        height: 80.0,

        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [

              Container(
                height: 40.0,
                child:VerticalDivider(
                  color: Colors.white,
                  width: 30.0,

                ),),


            ],),

            Container(
              width: 150.0,
              height: 60.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("رقم للتواصل: ${Data['number']}"
                    ,maxLines: 1,style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10.0,),
                  Text("البريد الاكتروني: ${Data['email']}",style: TextStyle(color: Colors.white ,fontSize: 7))
                ],),
            ),

            Row(

              children: [

              ],),

          ],),
      ),




    ],),
  ),
);