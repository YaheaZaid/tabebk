import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorAddReport extends StatefulWidget {
  final  int id;

  const DoctorAddReport({Key? key, required this.id}) : super(key: key);

  @override
  _DoctorAddReportState createState() => _DoctorAddReportState(id: id);
}

class _DoctorAddReportState extends State<DoctorAddReport> {
  final  int id;

  _DoctorAddReportState({Key? key, required this.id}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SafeArea(child: Container(
        color: Colors.lightBlueAccent,
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.white,)
                ,Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text("اضافة التقارير الطبية",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),

                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications)
                  ,color: Colors.white,),],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 650.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),border: Border.all(color: Colors.black),color: Colors.white),


              child: Column(children: [
                SizedBox(height:50.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0
                      ,horizontal: 20.0
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: Colors.blueAccent)),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0),),

                          hintText: "ادخل الرقم",hintStyle: TextStyle(color: Colors.blue,)),),


                  )
                  ,


                ),
                SizedBox(height: 60.0,),

                MaterialButton(onPressed: (){},shape: CircleBorder( ),

                    color: Colors.yellow[700],

                    padding: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("ارفاق ملف ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15.0),),
                          Icon(Icons.upload_outlined,size: 40.0,color: Colors.black,)

                        ],),
                    )),




                SizedBox(height: 150.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(

                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30.0),color: Colors.green[700]),
                            child: MaterialButton(onPressed: (){},child: Text("اضافة",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,)),
                      ),
                      SizedBox(width: 20.0,),
                      Expanded(
                        child: Container(

                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30.0),color: Colors.redAccent[700]),
                            child: MaterialButton(onPressed: (){},child: Text("اضافة",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),height: 40.0,)),
                      ),
                    ],
                  ),
                ),



              ],),
            ),
          )

        ],),
      ),),


    );
  }
}
