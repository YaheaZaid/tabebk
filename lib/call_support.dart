import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';


class SupportView extends StatefulWidget {
  @override
  _SupportViewState createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {

  List userProfilesList = [] ;

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(width: double.infinity,
              color: Colors.white70,
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Text("Support ",style:TextStyle(fontSize: 20.0),),
                    Divider(color: Colors.black ,thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.blueGrey,)
                        ,
                       ],),
                    SizedBox(height: 20.0,)
                    ,Container(
                        height: 550.0,
                        child: ListView.separated(itemBuilder: (context,index)=>Builddata(userProfilesList[index]), separatorBuilder: (context,index)=>SizedBox(height: 40.0,), itemCount: userProfilesList.length))




                  ],),
                ),
              ),
            ),
          ),


        ));

  }
  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getSView();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
}


Widget Builddata(var data)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(5.0),//or 15.0
      child: Container(
        height: 40.0,
        width: 40.0,
        color: Colors.blueGrey[700],
        child: Icon(Icons.person, color: Colors.white, size: 25.0),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 50.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start
        ,crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("${data['number']}:Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10.0,),maxLines: 2,textAlign: TextAlign.start,),


          Container(
              height: 60.0,
              width: 200.0,

              child: Text("${data['email']} :Email",maxLines: 2,style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),)),

        ],),
    ),

  ],),
);