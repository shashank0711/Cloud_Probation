import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rail_food/Screens/Auth/LoginScreen.dart';
import 'package:rail_food/Screens/Inside_Account_page/Help.dart';
import 'package:rail_food/Screens/Inside_Account_page/Orders.dart';
import 'package:rail_food/Screens/Inside_Account_page/NotificationPage.dart';
import 'package:rail_food/Screens/Inside_Account_page/ProfileInformation.dart';
import 'package:rail_food/utilities.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final firstNameController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height* 1/100,),

              //My Account text
              const Text(
                'My Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'font',
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),

              SizedBox(height: size.height*10/100,),

              SizedBox(height: 10,width: size.width*.9,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              //text for order
              Accountfeatures(context, 'Orders', Orders()),

              SizedBox(height: 10,width: size.width*.9,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              //text for profile information
              Accountfeatures(context, 'Profile Information', ProfileInformation()),

              SizedBox(height: 10,width: size.width*.9,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              //text for notification
              Accountfeatures(context, 'Notification', NotificationPage()),

              SizedBox(height: 10,width: size.width*.9,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              //text for help
              Accountfeatures(context, 'Help', Help()),

              SizedBox(height: 10,width: size.width*.9,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              //text for logout
               TextButton(
                 onPressed: (){
                   FirebaseAuth.instance.signOut();
                   Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context) => LoginScreen(),),);
                 },
                 style: TextButton.styleFrom(
                   foregroundColor: Colors.grey,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                      Text(
                       'Logout',
                       style: TextStyle(
                         fontFamily: 'font',
                         fontSize: 15,
                         color: Colors.black,
                       ),
                     ),
                      Icon(Icons.logout,color: Colors.black54,),
                   ],
                 ),
               ),

              SizedBox(height: 10,width: size.width*.9,
                child: const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              SizedBox(height: size.height*5/100,),



               //terms and condition
               const Text.rich(
                 TextSpan(
                 text: 'By placing your order, you accept our ',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  ),
                   children: [
                     TextSpan(
                       text: 'Terms & Conditions.',
                       style: TextStyle(
                         fontWeight: FontWeight.w300,
                         decoration: TextDecoration.underline,
                       ),
                     )
                   ],
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
