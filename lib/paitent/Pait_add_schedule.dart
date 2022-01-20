import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/DatabaseManager.dart';

class PaitAddSchedule extends StatefulWidget {
  final  int id;
  const PaitAddSchedule({Key? key, required this.id}) : super(key: key);  @override
  _PaitAddScheduleState createState() {
    return _PaitAddScheduleState( id: id);
  }
}

class _PaitAddScheduleState extends State<PaitAddSchedule> {
  List<String> items1 = <String>["فيصل","الجامعة الاردنية"];
  List<String> items2 = <String>["الباطني","الجراحة ","جلدية","المسالك البولية","الصدرية",];
  List<String> items3 = <String>["1/30/2021","2/2/2021","3/23/2021","2/10/2021","4/20/2021",];
  var dropdown;
  var dropdown1;
  var dropdown2;
  late String name;
  late String sec;
  late String date;
  final myController = TextEditingController();
  final DatabaseManager _auth =DatabaseManager();
  final  int id;

  _PaitAddScheduleState({Key? key, required this.id}) ;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body:SafeArea(

        child: Container(

          width: double.infinity,
          height: double.infinity,
          color: Colors.lightBlueAccent,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back,color: Colors.white,)),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Text('Add appointment ',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                    ),

SizedBox(width: 20,)                  ],),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(

                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.black)),
                  child: Column(children: [
                    SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(width: 300.0,alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.blue,width: 2)),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("Hospitla Name ",style: TextStyle(color: Colors.blue),),
                            dropdownColor: Colors.white,

                            style: TextStyle(fontSize: 23.0,color: Colors.blue),
                            iconSize: 30.0,
                            icon: Icon(Icons.arrow_drop_down,color: Colors.blue,),


                            onChanged: (String ?newvalue){
                              setState(() {
                                name = newvalue!;
                                print(name);
                                dropdown = newvalue;
                              });}
                            ,

                            value: dropdown,
                            items: items1.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(


                                value: value,
                                child: Text(value),



                              );},



                            ).toList(),),
                        ),

                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(width: 300.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.blue,width: 2)),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("Section",style: TextStyle(color: Colors.blue),),
                            dropdownColor: Colors.white,

                            style: TextStyle(fontSize: 23.0,color: Colors.blue),
                            iconSize: 30.0,
                            icon: Icon(Icons.arrow_drop_down,color: Colors.blue,),


                            onChanged: (String ?newvalue){
                              setState(() {
                                sec = newvalue!;
                                dropdown1 = newvalue;
                              });}
                            ,
                            value: dropdown1,
                            items: items2.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(


                                value: value,
                                child: Text(value),



                              );},



                            ).toList(),),
                        ),

                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(width: 300.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.blue,width: 2)),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("Date",style: TextStyle(color: Colors.blue),),
                            dropdownColor: Colors.white,
                            style: TextStyle(fontSize: 23.0,color: Colors.blue),
                            iconSize: 30.0,
                            icon: Icon(Icons.arrow_drop_down,color: Colors.blue,),


                            onChanged: (String ?newvalue){
                              setState(() {
                                date = newvalue!;

                                dropdown2 = newvalue;
                              });}
                            ,
                            value: dropdown2,
                            items: items3.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(


                                value: value,
                                child: Text(value),



                              );},



                            ).toList(),),
                        ),

                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0
                          ,vertical: 10.0
                      ),
                      child: TextFormField(
                        controller: myController,
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Note"),
                      ),),
                    SizedBox(height: 15.0,),

                    SizedBox(height: 15.0,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.orange),
                          width: double.infinity,
                          child: MaterialButton(onPressed: () async {
                            if (name.isNotEmpty&&sec.isNotEmpty&&date.isNotEmpty){
                              await _auth.addtowaiting(id, name, sec, date, myController.text.toString(), '123');

                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("Sent"),
                                  content: Text("Plase Wait ..We Wil Contact You"),
                                  actions: [
                                    CupertinoDialogAction(onPressed: (){Navigator.pop(context);},child: Text("Ok"),)

                                  ],

                                );

                              });
                            }
                            else{
                              SnackBar Mysnackbar = SnackBar(

                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Fill Blanks'),

                                    ],));
                              globalKey.currentState!.showSnackBar(Mysnackbar);

                            }

                          } ,child: Text('Add'),)),
                    ),
                    SizedBox(height: 30.0,),


                  ],),
                ),
              ),

            ],),
          ),
        ),
      ),

    );
  }
}
