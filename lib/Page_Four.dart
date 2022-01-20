import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabebk/paitent/one.dart';
import 'package:tabebk/paitent/two.dart';

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(

        child: Container(

          width: double.infinity,
          color: Colors.lightBlueAccent,

          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back,color: Colors.white,)),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text('الثقافة الصحية ',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                  ),

                ],),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 500.0,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.white,border: Border.all(color: Colors.black)),
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      SizedBox(height: 100.0,),
                        Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('العمليات',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                                  IconButton(onPressed: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Operaton()));

                                  }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                ],),
                            )

                          ],),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('الامراض المزمنة',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                                  IconButton(onPressed: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LnkScreen()));

                                  }, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                ],),
                            )

                          ],),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('امراض الشائعة',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right_alt,color: Colors.white,))
                                ],),
                            )

                          ],),
                        ),
                      ),

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
}
