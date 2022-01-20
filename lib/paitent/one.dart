import 'package:flutter/material.dart';

class DataModel{

  var nameoperaton;
  DataModel({
    @required this.nameoperaton,

  });
}


class LnkScreen extends StatelessWidget {

  List data=[

    DataModel(nameoperaton: "التهاب المفاصل"),
    DataModel(nameoperaton: "امراض القلب والاوعية الدموية"),
    DataModel(nameoperaton: "امراض الجاز التنفسي"),
    DataModel(nameoperaton: "عمليات فتك الصرة"),
    DataModel(nameoperaton: "السرطان"),
    DataModel(nameoperaton: "السكري"),
    DataModel(nameoperaton: "الصرع والنوبات "),
    DataModel(nameoperaton: "السمنة"),
    DataModel(nameoperaton: "مشاكل صحة الفم"),];
  @override
  Widget build(BuildContext context)


  {
    return Scaffold(

      body:SafeArea(

        child: Container(

          width: double.infinity,
          color: Colors.lightBlueAccent,

          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back,color: Colors.white,)),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Text('الامراض المزمنة',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                    ),

                    IconButton(onPressed: (){}, icon:Icon(Icons.notifications,color: Colors.white,)),
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 580.0,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.black)),
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        SizedBox(height: 50.0,),

                        Container(
                            height: 500.0,
                            child: ListView.separated(itemBuilder: (context,index)=>Bulddata(data[index]), separatorBuilder: (context,index)=>SizedBox(height: 40.0,), itemCount: data.length))










                      ],
                    ),
                  ),
                ),
              ),

            ],),
          ),
        ),
      ),

    );
  }
}


Widget Bulddata(DataModel Data)=>Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    color: Colors.blue,


    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(Data.nameoperaton,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20.0),),
        ),
        IconButton(onPressed: (){}, icon:Icon(Icons.arrow_right_alt,color: Colors.white) )



      ],),
  ),
);