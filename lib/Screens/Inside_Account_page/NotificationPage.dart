import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Notification',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'font',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),


        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: size.height * .02,),


              Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.fromLTRB(20,30,20,30),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                  ),
                  child: const Text('No Notification Right Now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'font',
                    color: Colors.black54
                   ),
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
