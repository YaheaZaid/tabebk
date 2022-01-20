import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPait extends StatefulWidget {
  final int id;
  const NotificationPait({ required this.id}) ;

  @override
  _NotificationPaitState createState() => _NotificationPaitState(id: id);
}

class _NotificationPaitState extends State<NotificationPait> {
  final int id;
  List userProfilesList = [];
  _NotificationPaitState({Key? key, required this.id}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(

            child: Container(

              width: double.infinity,
              color: Colors.lightBlueAccent,

              child: ListView.builder(
                  itemCount: userProfilesList.length,
                  itemBuilder: (context, index) {
                    final String item = userProfilesList[index];

                    return Dismissible(
                      key: Key(item),
                      onDismissed: (DismissDirection dir) {
                        setState(() => this.userProfilesList.removeAt(index));
                      }, child: Text("data"),

                    );
                  }
              ),
            )));
  }}
