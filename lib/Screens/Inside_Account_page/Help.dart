import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Help',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'font',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          children: [
            const Text('Rail Food helpline desk',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'font',
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              ),
            ),

            SizedBox(height: size.height* 1.5/100,),

            const Text.rich(
              TextSpan(
                text: 'Email us at ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: 'shashanksingh07011@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),


            SizedBox(height: size.height*.05,),


            GestureDetector(
              onTap: () {
                launch('tel://8960260971');
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber.shade700,
                    width: 2
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Icon(
                      Icons.phone,
                      color: Colors.amber.shade700,
                      size: 40,
                    ),

                    SizedBox(width: size.width * .04,),

                     Text(
                      '+91 8960260971',
                      style: TextStyle(
                        fontFamily: "font",
                        color: Colors.amber.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
