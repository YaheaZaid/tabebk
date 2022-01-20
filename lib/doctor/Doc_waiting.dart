import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';
class DoctotWating extends StatefulWidget {

  final  int id;
  const DoctotWating({Key? key, required this.id}) : super(key: key);

  @override
  _DoctotWatingState createState() => _DoctotWatingState(id:id);
}

class _DoctotWatingState extends State<DoctotWating> {
  final  int id;

  _DoctotWatingState({Key? key, required this.id}) ;
  List userProfilesList = [];
  DatabaseManager db =new DatabaseManager();

  @override
  void initState() {
    setState(() {
      super.initState();
      fetchDatabaseList(id);
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Container(

          width: double.infinity,
          color: Colors.lightBlueAccent,

          child: Column(children: [

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text('Make Appointment',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications)
                    ,color: Colors.white,),],),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 570.0,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.black)),
                child: SingleChildScrollView(
                  child: Column(

                    children: [

                      SizedBox(height: 50.0,),
                      Container(
                          height: 500.0,
                          child: ListView.separated(
                              itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(width: double.infinity,
                                color: Colors.lightBlueAccent,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [

                                      Text('${userProfilesList[index]['name']}:name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      Text('${userProfilesList[index]['number']}:number',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      Text('${userProfilesList[index]['section']}:section',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      Text('${userProfilesList[index]['date']}:date',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      Text('${userProfilesList[index]['note']}:note',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      Text('${userProfilesList[index]['']}File :',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                      Divider(color: Colors.white,thickness: 1,),
                                      Row(children: [
                                        IconButton(onPressed: (){
                                          setState(() {

                                            db.addShedule(id, userProfilesList[index]['id'], userProfilesList[index]['name'], userProfilesList[index]['number'], userProfilesList[index]['section'], userProfilesList[index]['date'], userProfilesList[index]['name']);
                                            var docRef = Firestore.instance.collection("Doctor").document(id.toString()).collection("Waiting");
                                            docRef.document(userProfilesList[index]['id'].toString()).delete();

                                          });
                                        }, icon: Icon(Icons.check,color: Colors.green,),
                                        ),
                                        IconButton(onPressed: (){
                                          setState(() {
                                            var docRef = Firestore.instance.collection("Doctor").document(id.toString()).collection("Waiting");
                                            docRef.document(userProfilesList[index]['id'].toString()).delete();


                                          });
                                          }, icon: Icon(Icons.close,color: Colors.red,),
                                        ),


                                      ],),

                                    ],),
                                ),
                              ),
                            );
                          }, separatorBuilder:(context,index){
                            return SizedBox(height: 20.0,);
                          }, itemCount: userProfilesList.length))



                    ],
                  ),
                ),
              ),
            ),

          ],),
        ),
      ),
    );
  }
  fetchDatabaseList(int id) async {
    dynamic resultant = await DatabaseManager().getWating(id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
}

