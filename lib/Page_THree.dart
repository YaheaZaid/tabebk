import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTHREE extends StatelessWidget
{

var value = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(),

        body: Builder(builder: (context) {
          return Container(
            child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(onPressed: (){
                      SnackBar Mysnackbar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.add_location,color: Colors.white,),
                              Text('sent location'),
                              Icon(Icons.check,color: Colors.white,)

                            ],));
                      Scaffold.of(context).showSnackBar(Mysnackbar);

                    },child: Text("location"),color: Colors.red,


                    ),
                    MaterialButton(onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("anashawas"),
                          content: Text("do you want  to  add hospital ?"),
                          actions: [
                            CupertinoDialogAction(onPressed: (){Navigator.pop(context);},child: Text("Ok"),)

                          ],

                        );

                      });

                    },child: Text("Showdailog",),color: Colors.grey,)
                  ],
                )),

          );

        },)
    );
  }
}
