import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';


class PaitSchedule extends StatefulWidget {
 final int id;
const PaitSchedule({ required this.id}) ;

  @override
  _PaitScheduleState createState() => _PaitScheduleState(id: id);
}

class _PaitScheduleState extends State<PaitSchedule> {
  final  int id;
  DatabaseManager db=new DatabaseManager();

  List userProfilesList = [];
  _PaitScheduleState({Key? key, required this.id}) ;
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.lightBlueAccent,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Text(
                          'Scheduled appointments',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: double.infinity,
                    height: 600.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              height: 550.0,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return  Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 120.0,
                                        decoration:
                                        BoxDecoration(border: Border.all(color: Colors.lightBlueAccent)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0, left: 15.0),
                                              child: Text(
                                                'Hospital : ${userProfilesList[index]['Hospital']}',
                                                style: TextStyle(color: Colors.lightBlueAccent),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Section : ${userProfilesList[index]['section']}',
                                                    style: TextStyle(color: Colors.lightBlueAccent),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15.0),
                                              child: Text(
                                                'Date :${userProfilesList[index]['date']}',
                                                style: TextStyle(color: Colors.lightBlueAccent),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );


                                    },
                                  itemCount:userProfilesList.length)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList(id);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }
}
