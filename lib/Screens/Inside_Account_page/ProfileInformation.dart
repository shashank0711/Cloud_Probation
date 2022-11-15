import 'package:flutter/material.dart';
import 'package:rail_food/utilities.dart';


class ProfileInformation extends StatefulWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {


  final firstNameController = new TextEditingController();
  final secondNameController = new TextEditingController();
  final phoneNumberController = new TextEditingController();
  final emailshowController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'font',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),


        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Profile Information',
                style: TextStyle(
                  fontFamily: 'font',
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),


              SizedBox(height: size.height*.02,),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextformProfile('Shashank', 'First Name'),
                  ),


                  SizedBox(width: size.width * .05,),

                  Expanded(
                      child: TextformProfile('Singh', 'Second Name'),
                  ),
                ],
              ),



              SizedBox(height: size.height*.06,),


              const Text('Phone Number',
                style: TextStyle(
                  fontFamily: 'font',
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),


              SizedBox(height: size.height*.02,),

              TextformProfile('8960260971', 'Phone Number'),



              SizedBox(height: size.height*.06,),


              const Text('Email Address',
                style: TextStyle(
                  fontFamily: 'font',
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),


              SizedBox(height: size.height*.02,),


              TextformProfile('ssy07112002@gmail.com', 'Email'),


            ],
          ),
        ),
    ),
    );
  }
}
